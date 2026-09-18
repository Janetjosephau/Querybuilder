import React from 'react';
import { Shield, Database, Cpu, FileText, CheckCircle2, AlertCircle } from 'lucide-react';

export default function Header({ 
  dbMode, 
  activeModel, 
  availableModels, 
  onSelectModel, 
  onOpenConnectModal, 
  onOpenAuditModal,
  npiMaskedTotal = 0
}) {
  return (
    <header className="border-b border-slate-800 bg-slate-900/90 backdrop-blur sticky top-0 z-30 px-4 py-3">
      <div className="max-w-7xl mx-auto flex flex-col md:flex-row md:items-center justify-between gap-3">
        
        {/* Brand & Title */}
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 rounded-xl bg-gradient-to-tr from-emerald-600 to-teal-400 flex items-center justify-center shadow-lg shadow-emerald-900/30">
            <Shield className="w-5 h-5 text-white" />
          </div>
          <div>
            <div className="flex items-center gap-2">
              <h1 className="font-bold text-lg text-slate-100 tracking-tight">Guidewire AI Query Studio</h1>
              <span className="text-[10px] uppercase font-semibold px-2 py-0.5 rounded-full bg-emerald-950 text-emerald-400 border border-emerald-800">
                Residential & Commercial
              </span>
            </div>
            <p className="text-xs text-slate-400">PolicyCenter • BillingCenter • ClaimCenter • PostgreSQL</p>
          </div>
        </div>

        {/* Status Pills & Controls */}
        <div className="flex items-center flex-wrap gap-2 text-xs">
          
          {/* NPI Shield Status */}
          <div className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-slate-800/80 border border-slate-700 text-slate-300">
            <Shield className="w-3.5 h-3.5 text-emerald-400" />
            <span>NPI Shield:</span>
            <span className="text-emerald-400 font-semibold flex items-center gap-1">
              Active
              {npiMaskedTotal > 0 && (
                <span className="px-1.5 py-0.2 rounded-full bg-emerald-900/80 text-[10px] text-emerald-300">
                  {npiMaskedTotal} masked
                </span>
              )}
            </span>
          </div>

          {/* Database Mode Switcher */}
          <button 
            onClick={onOpenConnectModal}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700/80 border border-slate-700 transition text-slate-300 hover:text-white"
            title="Configure Database Connection"
          >
            <Database className={`w-3.5 h-3.5 ${dbMode === 'imported' ? 'text-indigo-400' : dbMode === 'demo' ? 'text-emerald-400' : 'text-blue-400'}`} />
            <span className="text-slate-400">DB:</span>
            <span className="font-medium text-slate-200">
              {dbMode === 'imported' ? 'TWIA BC (1,296 Tables)' : dbMode === 'demo' ? 'Demo DB (11 Tables)' : 'Live PostgreSQL'}
            </span>
            <span className="text-[10px] px-1.5 py-0.2 rounded bg-slate-900 text-slate-400 border border-slate-700">
              {dbMode === 'imported' ? 'Active Schema' : dbMode === 'demo' ? 'In-Memory' : 'Connected'}
            </span>
          </button>

          {/* Ollama Model Selector */}
          <div className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-slate-800/80 border border-slate-700 text-slate-300">
            <Cpu className="w-3.5 h-3.5 text-purple-400" />
            <span className="text-slate-400">Ollama:</span>
            <select 
              value={activeModel} 
              onChange={(e) => onSelectModel(e.target.value)}
              className="bg-transparent text-purple-300 font-medium focus:outline-none cursor-pointer text-xs"
            >
              {availableModels.map(m => (
                <option key={m} value={m} className="bg-slate-800 text-slate-100">{m}</option>
              ))}
            </select>
          </div>

          {/* Compliance Audit Log */}
          <button 
            onClick={onOpenAuditModal}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 border border-slate-700 transition text-slate-300 hover:text-white"
          >
            <FileText className="w-3.5 h-3.5 text-amber-400" />
            <span>Audit Trail</span>
          </button>
        </div>

      </div>
    </header>
  );
}
