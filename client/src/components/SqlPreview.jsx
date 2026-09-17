import React, { useState } from 'react';
import { Terminal, Copy, Check, Play, ShieldCheck, HelpCircle, Loader2, Sparkles } from 'lucide-react';

// Formats SQL with syntax colors suited for clean white backgrounds
function renderHighlightedSql(sqlText) {
  if (!sqlText) return null;
  const tokenRegex = /('(?:''|[^'])*'|--[^\n]*|\b(?:SELECT|FROM|WHERE|LEFT\s+JOIN|RIGHT\s+JOIN|INNER\s+JOIN|FULL\s+JOIN|CROSS\s+JOIN|JOIN|ON|AND|OR|NOT|IN|IS|NULL|LIKE|ILIKE|GROUP\s+BY|ORDER\s+BY|HAVING|LIMIT|OFFSET|AS|ASC|DESC|DISTINCT|CASE|WHEN|THEN|ELSE|END|UNION|ALL|INTERSECT|EXCEPT|SUM|COUNT|AVG|MIN|MAX|ROUND|COALESCE)\b|\b\d+(?:\.\d+)?\b)/gi;
  const parts = sqlText.split(tokenRegex);

  return parts.map((part, idx) => {
    if (!part) return null;
    if (part.startsWith('--')) {
      return <span key={idx} className="text-slate-400 italic">{part}</span>;
    }
    if (part.startsWith("'")) {
      return <span key={idx} className="text-emerald-700 font-medium">{part}</span>;
    }
    if (/^\b\d+(?:\.\d+)?\b$/.test(part)) {
      return <span key={idx} className="text-amber-700 font-semibold">{part}</span>;
    }
    if (/^\b(?:SELECT|FROM|WHERE|LEFT\s+JOIN|RIGHT\s+JOIN|INNER\s+JOIN|FULL\s+JOIN|CROSS\s+JOIN|JOIN|ON|AND|OR|NOT|IN|IS|NULL|LIKE|ILIKE|GROUP\s+BY|ORDER\s+BY|HAVING|LIMIT|OFFSET|AS|ASC|DESC|DISTINCT|CASE|WHEN|THEN|ELSE|END|UNION|ALL|INTERSECT|EXCEPT|SUM|COUNT|AVG|MIN|MAX|ROUND|COALESCE)\b$/i.test(part)) {
      return <span key={idx} className="text-blue-700 font-bold">{part.toUpperCase()}</span>;
    }
    return <span key={idx} className="text-slate-800">{part}</span>;
  });
}

export default function SqlPreview({ 
  sql, 
  explanation, 
  confidence, 
  onRunSql, 
  isExecuting,
  isLoading = false,
  activePrompt = '',
  refreshedAt = null
}) {
  const [copied, setCopied] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [editableSql, setEditableSql] = useState(sql || '');

  React.useEffect(() => {
    setEditableSql(sql || '');
  }, [sql]);

  // If loading and no previous SQL, show loading skeleton
  if (isLoading && !sql) {
    return (
      <div className="rounded-2xl bg-white border border-slate-200 shadow-sm overflow-hidden animate-pulse p-6 space-y-4">
        <div className="flex items-center gap-2 text-emerald-600 text-xs font-semibold">
          <Loader2 className="w-4 h-4 animate-spin" />
          <span>Generating query for: &ldquo;{activePrompt}&rdquo;...</span>
        </div>
        <div className="space-y-2">
          <div className="h-4 bg-slate-100 rounded w-3/4"></div>
          <div className="h-4 bg-slate-100 rounded w-1/2"></div>
          <div className="h-4 bg-slate-100 rounded w-2/3"></div>
        </div>
      </div>
    );
  }

  if (!sql) return null;

  const handleCopy = () => {
    navigator.clipboard.writeText(editableSql);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const handleRun = () => {
    if (onRunSql) {
      onRunSql(editableSql);
    }
  };

  return (
    <div className="relative rounded-2xl bg-white border border-slate-200 shadow-sm overflow-hidden transition">
      
      {/* Active Generating Loading Overlay */}
      {isLoading && (
        <div className="absolute inset-0 bg-white/85 backdrop-blur-xs z-20 flex flex-col items-center justify-center gap-2 text-emerald-700 p-4 text-center">
          <Loader2 className="w-6 h-6 animate-spin text-emerald-600" />
          <div className="text-xs font-bold text-slate-800">
            Refreshing query for: <span className="text-emerald-600">&ldquo;{activePrompt}&rdquo;</span>
          </div>
          <div className="text-[11px] text-slate-500">
            Enforcing Guidewire catalog constraints & NPI protection...
          </div>
        </div>
      )}

      {/* Header Bar */}
      <div className="px-4 py-2.5 bg-slate-50/80 border-b border-slate-200 flex items-center justify-between flex-wrap gap-2">
        <div className="flex items-center gap-2 flex-wrap">
          <Terminal className="w-4 h-4 text-emerald-600" />
          <span className="text-xs font-bold text-emerald-600">Generated PostgreSQL Query</span>
          
          {/* Confidence Badge */}
          <span className={`text-[10px] font-medium px-2 py-0.5 rounded-full border ${
            confidence?.includes('low') 
              ? 'bg-amber-50 text-amber-700 border-amber-200' 
              : 'bg-emerald-50 text-emerald-700 border-emerald-200 flex items-center gap-1'
          }`}>
            <ShieldCheck className="w-3 h-3 text-emerald-600" />
            {confidence === 'high' ? 'Catalog Verified' : confidence}
          </span>

          {/* Refresh Timestamp Badge */}
          {refreshedAt && (
            <span className="text-[10px] font-medium px-2 py-0.5 rounded-full bg-slate-100 text-slate-600 border border-slate-200 flex items-center gap-1">
              <Sparkles className="w-2.5 h-2.5 text-teal-600" />
              <span>Updated {refreshedAt}</span>
            </span>
          )}
        </div>

        {/* Action Toolbar */}
        <div className="flex items-center gap-2">
          <button
            onClick={() => setIsEditing(!isEditing)}
            className="text-xs px-2.5 py-1 rounded-lg bg-white hover:bg-slate-100 text-slate-700 border border-slate-200 shadow-sm transition"
          >
            {isEditing ? 'View Mode' : 'Edit SQL'}
          </button>

          <button
            onClick={handleCopy}
            className="flex items-center gap-1 text-xs px-2.5 py-1 rounded-lg bg-white hover:bg-slate-100 text-slate-700 border border-slate-200 shadow-sm transition"
            title="Copy SQL to Clipboard"
          >
            {copied ? (
              <>
                <Check className="w-3.5 h-3.5 text-emerald-600" />
                <span className="text-emerald-700 font-medium">Copied</span>
              </>
            ) : (
              <>
                <Copy className="w-3.5 h-3.5 text-slate-500" />
                <span>Copy</span>
              </>
            )}
          </button>

          <button
            onClick={handleRun}
            disabled={isExecuting || isLoading}
            className="flex items-center gap-1.5 text-xs px-3 py-1 rounded-lg bg-emerald-600 hover:bg-emerald-500 text-white font-semibold transition shadow-sm shadow-emerald-700/20 disabled:opacity-50"
          >
            <Play className="w-3 h-3 fill-current" />
            <span>{isExecuting ? 'Running...' : 'Run Query'}</span>
          </button>
        </div>
      </div>

      {/* SQL Editor / Display (Pure White Background) */}
      <div className="p-4 bg-white font-mono text-xs leading-relaxed text-slate-800">
        {isEditing ? (
          <textarea
            value={editableSql}
            onChange={(e) => setEditableSql(e.target.value)}
            rows={6}
            className="w-full bg-slate-50 border border-slate-300 rounded-lg p-3 text-slate-900 font-mono text-xs focus:outline-none focus:border-emerald-500 focus:bg-white focus:ring-1 focus:ring-emerald-500 transition"
          />
        ) : (
          <pre className="overflow-x-auto whitespace-pre-wrap selection:bg-emerald-100">{renderHighlightedSql(editableSql)}</pre>
        )}
      </div>

      {/* Plain-English Explanation Footnote */}
      {explanation && (
        <div className="px-4 py-2.5 bg-slate-50/80 border-t border-slate-200 text-xs text-slate-700 flex items-start gap-2">
          <HelpCircle className="w-4 h-4 text-slate-500 flex-shrink-0 mt-0.5" />
          <p className="leading-normal">{explanation}</p>
        </div>
      )}
    </div>
  );
}
