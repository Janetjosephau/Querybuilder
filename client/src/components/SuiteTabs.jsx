import React from 'react';
import { Layers, FileCheck, Receipt, AlertOctagon } from 'lucide-react';

export default function SuiteTabs({ activeTab, onSelectTab }) {
  const tabs = [
    { id: 'all', label: 'All Guidewire Suites', icon: Layers, badge: 'Cross-Suite' },
    { id: 'pc', label: 'PolicyCenter', icon: FileCheck, badge: 'pc_*' },
    { id: 'bc', label: 'BillingCenter', icon: Receipt, badge: 'bc_*' },
    { id: 'cc', label: 'ClaimCenter', icon: AlertOctagon, badge: 'cc_*' },
  ];

  return (
    <div className="flex items-center gap-2 border-b border-slate-200 pb-3 overflow-x-auto">
      {tabs.map((tab) => {
        const Icon = tab.icon;
        const isActive = activeTab === tab.id;
        return (
          <button
            key={tab.id}
            onClick={() => onSelectTab(tab.id)}
            className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-medium transition whitespace-nowrap ${
              isActive
                ? 'bg-emerald-600 text-white shadow-sm shadow-emerald-900/20'
                : 'bg-slate-100 text-slate-600 hover:text-slate-900 hover:bg-slate-200/80 border border-slate-200'
            }`}
          >
            <Icon className="w-4 h-4" />
            <span>{tab.label}</span>
            <span
              className={`text-[10px] px-1.5 py-0.5 rounded ${
                isActive ? 'bg-emerald-700 text-emerald-100' : 'bg-slate-200 text-slate-600'
              }`}
            >
              {tab.badge}
            </span>
          </button>
        );
      })}
    </div>
  );
}
