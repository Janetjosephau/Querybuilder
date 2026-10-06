import React, { useState, useMemo } from 'react';
import { Database, ChevronDown, ChevronRight, ShieldAlert, Key, Table2, Search } from 'lucide-react';

export default function SchemaSidebar({ schema, onSelectTable, selectedSuite }) {
  const [openTables, setOpenTables] = useState({ bc_account: true, bc_invoice: true, pc_policy: true });
  const [searchFilter, setSearchFilter] = useState('');

  const toggleTable = (tblName) => {
    setOpenTables(prev => ({ ...prev, [tblName]: !prev[tblName] }));
  };

  const tables = schema?.tables || [];

  // Filter tables by search query
  const filteredTables = useMemo(() => {
    if (!searchFilter.trim()) return tables;
    const q = searchFilter.toLowerCase().trim();
    return tables.filter(t => t.name.toLowerCase().includes(q));
  }, [tables, searchFilter]);

  const isBcTable = (name) => {
    const n = (name || '').toLowerCase();
    return n.startsWith('bc_') || n.startsWith('bcst_') || n.startsWith('bctl_') || n.startsWith('bcx_') || n.startsWith('bc');
  };
  const isPcTable = (name) => {
    const n = (name || '').toLowerCase();
    return n.startsWith('pc_') || n.startsWith('pcst_') || n.startsWith('pctl_') || n.startsWith('pcx_') || n.startsWith('pc');
  };
  const isCcTable = (name) => {
    const n = (name || '').toLowerCase();
    return n.startsWith('cc_') || n.startsWith('ccst_') || n.startsWith('cctl_') || n.startsWith('ccx_') || n.startsWith('cc');
  };

  // Categorize tables by suite prefix (supporting core, staging bcst, typelists bctl, extensions bcx)
  const bcTables = filteredTables.filter(t => isBcTable(t.name));
  const pcTables = filteredTables.filter(t => isPcTable(t.name));
  const ccTables = filteredTables.filter(t => isCcTable(t.name));
  const otherTables = filteredTables.filter(t => !isBcTable(t.name) && !isPcTable(t.name) && !isCcTable(t.name));

  const suiteGroups = [];
  if (bcTables.length > 0) {
    suiteGroups.push({ id: 'bc', title: 'BillingCenter', prefix: 'bc*, bcst*, bctl*, bcx*', list: bcTables, color: 'text-indigo-400' });
  }
  if (pcTables.length > 0) {
    suiteGroups.push({ id: 'pc', title: 'PolicyCenter', prefix: 'pc*, pcst*, pctl*, pcx*', list: pcTables, color: 'text-sky-400' });
  }
  if (ccTables.length > 0) {
    suiteGroups.push({ id: 'cc', title: 'ClaimCenter', prefix: 'cc*, ccst*, cctl*, ccx*', list: ccTables, color: 'text-amber-400' });
  }
  if (otherTables.length > 0) {
    suiteGroups.push({ id: 'other', title: 'Other Tables', prefix: schema?.mode === 'imported' ? 'twia' : 'public', list: otherTables, color: 'text-emerald-400' });
  }

  return (
    <aside className="w-80 bg-slate-900 border-r border-slate-800 p-3.5 space-y-3 overflow-y-auto flex-shrink-0 flex flex-col h-full">
      <div className="flex items-center justify-between pb-2 border-b border-slate-800">
        <div className="flex items-center gap-2">
          <Database className="w-4 h-4 text-emerald-400" />
          <h2 className="font-bold text-xs text-slate-200 tracking-wide uppercase">
            {schema?.mode === 'imported' ? 'TWIA BillingCenter' : 'Schema Catalog'}
          </h2>
        </div>
        <span className="text-[10px] px-1.5 py-0.5 rounded bg-slate-800 text-slate-300 font-mono">
          {filteredTables.length} {searchFilter ? 'matches' : 'tables'}
        </span>
      </div>

      {/* Quick Table Search */}
      <div className="relative">
        <Search className="w-3.5 h-3.5 text-slate-500 absolute left-2.5 top-1/2 -translate-y-1/2" />
        <input
          type="text"
          value={searchFilter}
          onChange={(e) => setSearchFilter(e.target.value)}
          placeholder="Filter 1,200+ tables (e.g. account, invoice)..."
          className="w-full bg-slate-950 border border-slate-800 rounded-lg pl-8 pr-7 py-1.5 text-xs text-slate-200 placeholder-slate-500 focus:outline-none focus:border-emerald-500 transition"
        />
        {searchFilter && (
          <button
            onClick={() => setSearchFilter('')}
            className="absolute right-2 top-1/2 -translate-y-1/2 text-xs text-slate-500 hover:text-slate-300 px-1"
          >
            ✕
          </button>
        )}
      </div>

      <div className="space-y-3 text-xs">
        {suiteGroups.map((group, gIdx) => {
          const isSelected = selectedSuite && group.id === selectedSuite;
          return (
            <div key={gIdx} className={`space-y-1.5 p-1.5 rounded-xl transition ${isSelected ? 'bg-slate-800/60 ring-1 ring-emerald-500/40' : ''}`}>
              <div className="flex items-center justify-between text-[11px] font-semibold text-slate-400">
                <div className="flex items-center gap-1.5">
                  <span className={group.color}>{group.title}</span>
                  {isSelected && (
                    <span className="text-[9px] px-1.5 py-0.2 rounded-full bg-emerald-950 text-emerald-300 border border-emerald-700/60 font-medium">Selected</span>
                  )}
                </div>
                <span className="text-slate-600 font-mono">{group.prefix}</span>
              </div>

            <div className="space-y-1">
              {group.list.map(tbl => {
                const isOpen = openTables[tbl.name];
                const npiColsCount = tbl.columns.filter(c => c.isNpi).length;

                return (
                  <div key={tbl.name} className="rounded-lg bg-slate-950/60 border border-slate-800/80 overflow-hidden">
                    <button
                      onClick={() => toggleTable(tbl.name)}
                      className="w-full flex items-center justify-between p-2 text-left hover:bg-slate-800/40 transition"
                    >
                      <div className="flex items-center gap-1.5 truncate">
                        {isOpen ? (
                          <ChevronDown className="w-3 h-3 text-slate-500 flex-shrink-0" />
                        ) : (
                          <ChevronRight className="w-3 h-3 text-slate-500 flex-shrink-0" />
                        )}
                        <Table2 className="w-3.5 h-3.5 text-slate-400 flex-shrink-0" />
                        <span className="font-mono text-[11px] text-slate-200 truncate">{tbl.name}</span>
                      </div>

                      {npiColsCount > 0 && (
                        <span className="text-[9px] px-1 py-0.2 rounded bg-emerald-950 text-emerald-400 border border-emerald-800" title={`${npiColsCount} NPI columns protected`}>
                          NPI
                        </span>
                      )}
                    </button>

                    {isOpen && (
                      <div className="px-3 pb-2 pt-1 border-t border-slate-900 space-y-1 bg-slate-950/90">
                        {tbl.columns.map(col => (
                          <div key={col.name} className="flex items-center justify-between text-[10px] font-mono py-0.5">
                            <div className="flex items-center gap-1 text-slate-300 truncate">
                              {col.name === 'id' && <Key className="w-2.5 h-2.5 text-amber-400" />}
                              <span>{col.name}</span>
                            </div>
                            <div className="flex items-center gap-1 text-slate-500">
                              <span>{col.type}</span>
                              {col.isNpi && (
                                <ShieldAlert className="w-2.5 h-2.5 text-emerald-400" title="Dynamic Data Masking Active" />
                              )}
                            </div>
                          </div>
                        ))}

                        <button
                          onClick={() => onSelectTable(tbl.name)}
                          className="w-full mt-1.5 text-center text-[10px] py-1 rounded bg-slate-900 hover:bg-slate-800 text-emerald-400 border border-slate-800 transition"
                        >
                          Preview Table
                        </button>
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          </div>
        );
      })}
      </div>
    </aside>
  );
}
