import React from 'react';
import { BarChart3, PieChart, TrendingUp, DollarSign, Activity } from 'lucide-react';

export default function VisualChart({ rows = [], suggestedType = 'bar' }) {
  if (!rows || rows.length === 0) return null;

  // Detect if we have product line metrics (Residential vs Commercial)
  const hasProductLine = rows.some(r => r.productcode || r.product_line);
  
  // Find numeric keys
  const firstRow = rows[0];
  const numericKeys = Object.keys(firstRow).filter(k => typeof firstRow[k] === 'number');

  if (numericKeys.length === 0) return null;

  const primaryMetric = numericKeys.find(k => k.includes('premium') || k.includes('loss') || k.includes('amount') || k.includes('reserves')) || numericKeys[0];
  const maxVal = Math.max(...rows.map(r => r[primaryMetric] || 0), 1);

  return (
    <div className="rounded-2xl bg-slate-900 border border-slate-800 p-4 shadow-xl space-y-4">
      {/* Chart Header */}
      <div className="flex items-center justify-between border-b border-slate-800 pb-2">
        <div className="flex items-center gap-2">
          <BarChart3 className="w-4 h-4 text-emerald-400" />
          <h3 className="font-semibold text-xs text-slate-200 uppercase tracking-wider">
            Auto-Visualization: {primaryMetric.replace(/_/g, ' ')}
          </h3>
        </div>
        <span className="text-[10px] px-2 py-0.5 rounded-full bg-slate-800 text-slate-400 font-mono">
          Residential & Commercial Insights
        </span>
      </div>

      {/* Metric Cards Summary */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-2.5">
        {rows.slice(0, 4).map((row, idx) => {
          const label = row.productcode || row.product_line || row.claimnumber || row.invoicenumber || `Record #${idx + 1}`;
          const val = row[primaryMetric];
          return (
            <div key={idx} className="p-3 rounded-xl bg-slate-950 border border-slate-800/80 space-y-1">
              <span className="text-[11px] font-medium text-slate-400 truncate block">{label}</span>
              <div className="text-sm font-bold text-emerald-400 font-mono">
                {typeof val === 'number' ? val.toLocaleString() : val}
              </div>
              <span className="text-[9px] text-slate-500 uppercase tracking-wider block">{primaryMetric}</span>
            </div>
          );
        })}
      </div>

      {/* Visual Bar Comparison */}
      <div className="space-y-2.5 pt-2">
        {rows.slice(0, 6).map((row, idx) => {
          const label = row.productcode || row.product_line || row.claimnumber || row.invoicenumber || `Item ${idx + 1}`;
          const val = row[primaryMetric] || 0;
          const pct = Math.min(Math.round((val / maxVal) * 100), 100);
          const isCommercial = String(label).toLowerCase().includes('commercial');
          const barColor = isCommercial 
            ? 'from-indigo-600 to-purple-500' 
            : 'from-emerald-600 to-teal-400';

          return (
            <div key={idx} className="space-y-1">
              <div className="flex justify-between text-xs font-mono">
                <span className="text-slate-300 font-sans">{label}</span>
                <span className="text-emerald-400 font-semibold">{val.toLocaleString()}</span>
              </div>
              <div className="w-full h-2.5 rounded-full bg-slate-950 overflow-hidden border border-slate-800">
                <div 
                  className={`h-full rounded-full bg-gradient-to-r ${barColor} transition-all duration-500`}
                  style={{ width: `${Math.max(pct, 4)}%` }}
                />
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
