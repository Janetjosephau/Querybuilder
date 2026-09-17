import React from 'react';
import { Sparkles, Home, Building2, ShieldAlert } from 'lucide-react';

export default function PromptChips({ onSelectPrompt, activeTab }) {
  const promptCategories = [
    {
      category: 'Cross-Suite & Loss Analytics',
      icon: Sparkles,
      color: 'text-amber-400',
      suites: ['all'],
      items: [
        'What is our loss ratio for Residential vs Commercial?',
        'Compare total written premium between Residential and Commercial policies'
      ]
    },
    {
      category: 'Residential Insurance (Homeowners/Dwelling)',
      icon: Home,
      color: 'text-sky-400',
      suites: ['all', 'pc', 'cc'],
      items: [
        'Show in-force Residential policies with policyholder details',
        'List open claims for Residential policies and their loss cause',
        'List past-due invoices for Residential accounts'
      ]
    },
    {
      category: 'Commercial Insurance (Property & Liability)',
      icon: Building2,
      color: 'text-indigo-400',
      suites: ['all', 'pc', 'cc', 'bc'],
      items: [
        'Show top 10 open Commercial claims with reserves over $50,000',
        'List commercial accounts billed via Agency Bill with outstanding balances',
        'Show Commercial policies with building coverages over $2,000,000'
      ]
    },
    {
      category: 'Security & Anti-Hallucination Guardrails Test',
      icon: ShieldAlert,
      color: 'text-emerald-400',
      suites: ['all', 'pc'],
      items: [
        'Show policyholders contact and ssn (Test NPI Dynamic Masking)',
        'Show policyholders with a credit score above 720 (Test Anti-Hallucination Guardrail)'
      ]
    }
  ];

  // Filter categories matching active suite tab
  const visibleCategories = promptCategories.filter(cat => 
    activeTab === 'all' || cat.suites.includes(activeTab)
  );

  return (
    <div className="space-y-3">
      <div className="flex items-center gap-1.5 text-xs font-semibold text-slate-400 uppercase tracking-wider">
        <Sparkles className="w-3.5 h-3.5 text-emerald-400" />
        <span>Quick Insurance Prompts (Residential & Commercial)</span>
      </div>

      <div className="space-y-2.5">
        {visibleCategories.map((cat, idx) => {
          const Icon = cat.icon;
          return (
            <div key={idx} className="space-y-1.5">
              <div className="flex items-center gap-1.5 text-[11px] font-medium text-slate-400">
                <Icon className={`w-3 h-3 ${cat.color}`} />
                <span>{cat.category}</span>
              </div>
              <div className="flex flex-wrap gap-1.5">
                {cat.items.map((prompt, pIdx) => (
                  <button
                    key={pIdx}
                    onClick={() => onSelectPrompt(prompt)}
                    className="text-left text-xs px-3 py-1.5 rounded-lg bg-slate-900 hover:bg-slate-800 border border-slate-800 hover:border-slate-700 text-slate-300 hover:text-white transition duration-150 flex items-center gap-1.5 group shadow-sm"
                  >
                    <span className="text-slate-500 group-hover:text-emerald-400 font-mono text-[10px]">›</span>
                    <span>{prompt}</span>
                  </button>
                ))}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
