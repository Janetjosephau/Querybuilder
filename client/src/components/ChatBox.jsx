import React, { useState } from 'react';
import { Send, Sparkles, Loader2, ShieldCheck, AlertTriangle, RotateCcw } from 'lucide-react';

export default function ChatBox({ onSubmit, isLoading, reasoningStep, error, insufficientInfo, onRetry, lastPrompt }) {
  const [input, setInput] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!input.trim() || isLoading) return;
    const text = input.trim();
    onSubmit(text);
  };

  const pipelineSteps = [
    { num: '1', name: 'Fact Extraction' },
    { num: '2', name: 'Gap Analysis' },
    { num: '3', name: 'Grounded SQL' },
    { num: '4', name: 'Catalog Self-Check' },
    { num: '5', name: 'Masked Execution' }
  ];

  return (
    <div className="space-y-3">
      {/* Expanded Prompt Card (Matches Result Window Dimensions) */}
      <form onSubmit={handleSubmit}>
        <div className="rounded-2xl bg-white border border-slate-200 shadow-sm overflow-hidden focus-within:border-emerald-500 focus-within:ring-2 focus-within:ring-emerald-500/20 transition">
          
          {/* Header Bar */}
          <div className="px-4 py-2.5 bg-slate-50/80 border-b border-slate-200 flex items-center justify-between flex-wrap gap-2">
            <div className="flex items-center gap-2">
              <Sparkles className="w-4 h-4 text-emerald-600" />
              <span className="text-xs font-bold text-emerald-600">Describe your data request</span>
              <span className="text-[10px] font-medium px-2 py-0.5 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200 flex items-center gap-1">
                <ShieldCheck className="w-3 h-3 text-emerald-600" />
                Air-Gapped Local AI
              </span>
            </div>

            <div className="flex items-center gap-2">
              {input && (
                <button
                  type="button"
                  onClick={() => setInput('')}
                  disabled={isLoading}
                  className="text-xs px-2.5 py-1 rounded-lg bg-white hover:bg-slate-100 text-slate-600 hover:text-slate-900 border border-slate-200 shadow-sm transition"
                >
                  Clear
                </button>
              )}
              <button
                type="submit"
                disabled={!input.trim() || isLoading}
                className={`flex items-center gap-1.5 px-3.5 py-1.5 rounded-lg text-xs font-semibold transition ${
                  !input.trim() || isLoading
                    ? 'bg-slate-100 text-slate-400 border border-slate-200 cursor-not-allowed'
                    : 'bg-emerald-600 hover:bg-emerald-500 text-white shadow-sm shadow-emerald-700/20'
                }`}
              >
                {isLoading ? (
                  <>
                    <Loader2 className="w-3.5 h-3.5 animate-spin" />
                    <span>Processing...</span>
                  </>
                ) : (
                  <>
                    <Send className="w-3.5 h-3.5" />
                    <span>Generate SQL</span>
                  </>
                )}
              </button>
            </div>
          </div>

          {/* Multiline Prompt Area */}
          <div className="p-4 bg-white">
            <textarea
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                  e.preventDefault();
                  handleSubmit(e);
                }
              }}
              rows={5}
              placeholder="Ask any question about Guidewire PolicyCenter, BillingCenter, or ClaimCenter in plain English (e.g. 'Show loss ratio by product line comparing Residential and Commercial written premium with incurred losses')...&#10;&#10;Tip: Press Enter ↵ to generate query, or Shift + Enter for a new line."
              className="w-full bg-transparent text-sm leading-relaxed text-slate-900 placeholder-slate-400 focus:outline-none resize-y min-h-[110px]"
              disabled={isLoading}
            />
          </div>

          {/* Footer Toolbar */}
          <div className="px-4 py-2 bg-slate-50/80 border-t border-slate-200 flex items-center justify-between text-[11px] text-slate-500 flex-wrap gap-2">
            <div className="flex items-center gap-2">
              <span className="font-medium text-slate-600">Target Entities:</span>
              <span className="text-slate-700 font-mono text-[10px] bg-slate-100 px-1.5 py-0.5 rounded border border-slate-200">pc_* PolicyCenter</span>
              <span className="text-slate-700 font-mono text-[10px] bg-slate-100 px-1.5 py-0.5 rounded border border-slate-200">bc_* BillingCenter</span>
              <span className="text-slate-700 font-mono text-[10px] bg-slate-100 px-1.5 py-0.5 rounded border border-slate-200">cc_* ClaimCenter</span>
            </div>
            <div className="text-[10px] text-slate-500 font-medium">
              {input.length} chars • Enter ↵ to Generate
            </div>
          </div>
        </div>
      </form>

      {/* Real-Time Reasoning Pipeline Progress */}
      {isLoading && (
        <div className="p-3.5 rounded-xl bg-slate-50 border border-slate-200 space-y-2.5 animate-pulse shadow-sm">
          <div className="flex items-center justify-between text-xs text-slate-600">
            <span className="flex items-center gap-1.5 font-semibold text-emerald-700">
              <ShieldCheck className="w-4 h-4 text-emerald-600" />
              Anti-Hallucination & Security Verification Pipeline
            </span>
            <span className="text-[11px] text-slate-500 font-medium">Zero Cloud Egress • 100% Local Ollama</span>
          </div>
          <div className="grid grid-cols-5 gap-2">
            {pipelineSteps.map((step, idx) => (
              <div 
                key={idx}
                className="flex items-center gap-1.5 p-2 rounded-lg bg-white border border-slate-200 text-[11px] shadow-2xs"
              >
                <span className="w-4 h-4 rounded-full bg-emerald-100 text-emerald-700 border border-emerald-300 flex items-center justify-center text-[10px] font-bold">
                  {step.num}
                </span>
                <span className="text-slate-700 font-medium truncate">{step.name}</span>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Anti-Hallucination "Insufficient Information" Alert */}
      {insufficientInfo && (
        <div className="p-4 rounded-xl bg-amber-950/40 border border-amber-800/80 text-amber-200 flex items-start gap-3 shadow-lg">
          <AlertTriangle className="w-5 h-5 text-amber-400 flex-shrink-0 mt-0.5" />
          <div className="space-y-1">
            <div className="flex items-center gap-2">
              <h4 className="text-xs font-bold uppercase tracking-wider text-amber-300">
                Anti-Hallucination Rule Enforced
              </h4>
              <span className="text-[10px] px-2 py-0.5 rounded bg-amber-900/60 text-amber-300 border border-amber-700/60">
                Rule #3: Missing Schema Attribute
              </span>
            </div>
            <p className="text-xs text-amber-200/90 leading-relaxed">{insufficientInfo}</p>
            <p className="text-[11px] text-amber-400/80">
              The query was halted safely without guessing or fabricating non-existent database attributes.
            </p>
          </div>
        </div>
      )}

      {/* General Error Banner with Try Again Button */}
      {error && !insufficientInfo && (
        <div className="p-4 rounded-xl bg-rose-950/50 border border-rose-800/90 text-rose-200 shadow-lg flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-xs">
          <div className="flex items-start gap-3">
            <AlertTriangle className="w-5 h-5 text-rose-400 flex-shrink-0 mt-0.5" />
            <div className="space-y-0.5">
              <div className="font-semibold text-rose-300">Inference Error</div>
              <p className="text-rose-200/90 leading-relaxed">{error}</p>
            </div>
          </div>
          {onRetry && (
            <button
              type="button"
              onClick={onRetry}
              disabled={isLoading}
              className="self-start sm:self-center flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-rose-800 hover:bg-rose-700 text-white font-medium transition shadow flex-shrink-0"
            >
              <RotateCcw className="w-3.5 h-3.5" />
              <span>Try Again</span>
            </button>
          )}
        </div>
      )}
    </div>
  );
}
