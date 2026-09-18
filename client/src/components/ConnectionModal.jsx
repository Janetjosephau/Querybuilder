import React, { useState } from 'react';
import { X, Database, CheckCircle, AlertCircle, Loader2, KeyRound } from 'lucide-react';

export default function ConnectionModal({ isOpen, onClose, currentMode, onConnect }) {
  const [mode, setMode] = useState(currentMode || 'demo');
  const [config, setConfig] = useState({
    host: 'localhost',
    port: '5432',
    database: 'guidewire_db',
    user: 'postgres',
    password: '',
    ssl: false,
    connectionString: ''
  });
  const [loading, setLoading] = useState(false);
  const [statusMsg, setStatusMsg] = useState(null);

  if (!isOpen) return null;

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setStatusMsg(null);

    try {
      await onConnect(mode, config);
      setStatusMsg({ success: true, text: `Connected successfully in ${mode.toUpperCase()} mode!` });
      setTimeout(() => {
        onClose();
      }, 1000);
    } catch (err) {
      setStatusMsg({ success: false, text: err.message });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 backdrop-blur-sm p-4">
      <div className="w-full max-w-lg rounded-2xl bg-slate-900 border border-slate-800 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
        
        {/* Modal Header */}
        <div className="px-5 py-4 bg-slate-950 border-b border-slate-800 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Database className="w-5 h-5 text-emerald-400" />
            <h2 className="font-bold text-sm text-slate-100">Database Connection Manager</h2>
          </div>
          <button onClick={onClose} className="text-slate-500 hover:text-slate-200 p-1 rounded-lg">
            <X className="w-4 h-4" />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="p-5 space-y-4 text-xs">
          {/* Mode Selector Tabs */}
          <div className="grid grid-cols-3 gap-1.5 p-1 rounded-xl bg-slate-950 border border-slate-800">
            <button
              type="button"
              onClick={() => setMode('imported')}
              className={`py-2 px-2.5 rounded-lg font-medium text-[11px] transition ${
                mode === 'imported'
                  ? 'bg-indigo-600 text-white shadow-md'
                  : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              TWIA BC (1,296 Tables)
            </button>
            <button
              type="button"
              onClick={() => setMode('demo')}
              className={`py-2 px-2.5 rounded-lg font-medium text-[11px] transition ${
                mode === 'demo'
                  ? 'bg-emerald-600 text-white shadow-md'
                  : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              Demo DB (11 Tables)
            </button>
            <button
              type="button"
              onClick={() => setMode('postgres')}
              className={`py-2 px-2.5 rounded-lg font-medium text-[11px] transition ${
                mode === 'postgres'
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              Live PostgreSQL
            </button>
          </div>

          {mode === 'imported' ? (
            <div className="p-4 rounded-xl bg-indigo-950/40 border border-indigo-800/60 space-y-2 text-slate-300">
              <div className="flex items-center gap-2 text-indigo-400 font-semibold">
                <CheckCircle className="w-4 h-4" />
                <span>TWIA Guidewire BillingCenter QA02 Schema Ready</span>
              </div>
              <p className="text-slate-400 leading-relaxed text-[11px]">
                Active schema extracted from <span className="font-mono text-indigo-300">dump-twia_gwcppre_qa02_bc-202609181333.sql</span> containing <strong>1,296 tables</strong> (including 511 core <span className="font-mono text-indigo-300">bc_*</span> entities). The AI Assistant can query this exact enterprise structure directly.
              </p>
            </div>
          ) : mode === 'demo' ? (
            <div className="p-4 rounded-xl bg-slate-950/80 border border-slate-800/80 space-y-2 text-slate-300">
              <div className="flex items-center gap-2 text-emerald-400 font-semibold">
                <CheckCircle className="w-4 h-4" />
                <span>Preloaded Guidewire Insurance Dataset Ready</span>
              </div>
              <p className="text-slate-400 leading-relaxed text-[11px]">
                Preloaded with 11 relational tables across <strong>PolicyCenter</strong>, <strong>BillingCenter</strong>, and <strong>ClaimCenter</strong> with synthetic records for testing queries and NPI masking.
              </p>
            </div>
          ) : (
            <div className="space-y-3">
              <div className="grid grid-cols-3 gap-2">
                <div className="col-span-2 space-y-1">
                  <label className="text-slate-400 font-medium">Host</label>
                  <input
                    type="text"
                    value={config.host}
                    onChange={(e) => setConfig({ ...config, host: e.target.value })}
                    className="w-full bg-slate-950 border border-slate-800 rounded-lg px-3 py-1.5 text-slate-200 focus:outline-none focus:border-blue-500"
                  />
                </div>
                <div className="space-y-1">
                  <label className="text-slate-400 font-medium">Port</label>
                  <input
                    type="text"
                    value={config.port}
                    onChange={(e) => setConfig({ ...config, port: e.target.value })}
                    className="w-full bg-slate-950 border border-slate-800 rounded-lg px-3 py-1.5 text-slate-200 focus:outline-none focus:border-blue-500"
                  />
                </div>
              </div>

              <div className="space-y-1">
                <label className="text-slate-400 font-medium">Database Name</label>
                <input
                  type="text"
                  value={config.database}
                  onChange={(e) => setConfig({ ...config, database: e.target.value })}
                  className="w-full bg-slate-950 border border-slate-800 rounded-lg px-3 py-1.5 text-slate-200 focus:outline-none focus:border-blue-500"
                />
              </div>

              <div className="grid grid-cols-2 gap-2">
                <div className="space-y-1">
                  <label className="text-slate-400 font-medium">Username</label>
                  <input
                    type="text"
                    value={config.user}
                    onChange={(e) => setConfig({ ...config, user: e.target.value })}
                    className="w-full bg-slate-950 border border-slate-800 rounded-lg px-3 py-1.5 text-slate-200 focus:outline-none focus:border-blue-500"
                  />
                </div>
                <div className="space-y-1">
                  <label className="text-slate-400 font-medium">Password</label>
                  <input
                    type="password"
                    value={config.password}
                    onChange={(e) => setConfig({ ...config, password: e.target.value })}
                    placeholder="••••••••"
                    className="w-full bg-slate-950 border border-slate-800 rounded-lg px-3 py-1.5 text-slate-200 focus:outline-none focus:border-blue-500"
                  />
                </div>
              </div>

              <div className="flex items-center gap-2 pt-1">
                <input
                  type="checkbox"
                  id="ssl"
                  checked={config.ssl}
                  onChange={(e) => setConfig({ ...config, ssl: e.target.checked })}
                  className="rounded bg-slate-950 border-slate-800 text-blue-600 focus:ring-0"
                />
                <label htmlFor="ssl" className="text-slate-300 text-[11px] cursor-pointer">
                  Require SSL / TLS (recommended for cloud PostgreSQL like RDS/Supabase/Neon)
                </label>
              </div>
            </div>
          )}

          {/* Feedback Message */}
          {statusMsg && (
            <div className={`p-2.5 rounded-lg flex items-center gap-2 text-xs ${
              statusMsg.success ? 'bg-emerald-950 text-emerald-300 border border-emerald-800' : 'bg-rose-950 text-rose-300 border border-rose-800'
            }`}>
              {statusMsg.success ? <CheckCircle className="w-4 h-4" /> : <AlertCircle className="w-4 h-4" />}
              <span>{statusMsg.text}</span>
            </div>
          )}

          {/* Modal Footer */}
          <div className="flex items-center justify-end gap-2 pt-3 border-t border-slate-800">
            <button
              type="button"
              onClick={onClose}
              className="px-3.5 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-300 transition"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={loading}
              className="px-4 py-1.5 rounded-lg bg-emerald-600 hover:bg-emerald-500 text-white font-medium transition shadow-md shadow-emerald-900/30 flex items-center gap-1.5"
            >
              {loading && <Loader2 className="w-3.5 h-3.5 animate-spin" />}
              <span>{mode === 'demo' ? 'Activate Demo DB' : 'Connect & Test'}</span>
            </button>
          </div>
        </form>

      </div>
    </div>
  );
}
