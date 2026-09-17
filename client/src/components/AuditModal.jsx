import React, { useState, useEffect } from 'react';
import { X, FileText, Shield, Clock, Download, CheckCircle2, AlertCircle } from 'lucide-react';

export default function AuditModal({ isOpen, onClose }) {
  const [logs, setLogs] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (isOpen) {
      fetchLogs();
    }
  }, [isOpen]);

  const fetchLogs = async () => {
    setLoading(true);
    try {
      const res = await fetch('/api/audit');
      const data = await res.json();
      if (data.success) {
        setLogs(data.logs || []);
      }
    } catch (err) {
      console.error('Failed to load audit logs:', err);
    } finally {
      setLoading(false);
    }
  };

  const handleDownload = () => {
    if (!logs.length) return;
    const blob = new Blob([JSON.stringify(logs, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `guidewire_compliance_audit_${new Date().toISOString().slice(0, 10)}.json`;
    a.click();
    URL.revokeObjectURL(url);
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 backdrop-blur-sm p-4">
      <div className="w-full max-w-3xl rounded-2xl bg-slate-900 border border-slate-800 shadow-2xl overflow-hidden flex flex-col max-h-[85vh] animate-in fade-in zoom-in-95 duration-150">
        
        {/* Modal Header */}
        <div className="px-5 py-4 bg-slate-950 border-b border-slate-800 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Shield className="w-5 h-5 text-emerald-400" />
            <div>
              <h2 className="font-bold text-sm text-slate-100">Compliance & Security Audit Trail</h2>
              <p className="text-[11px] text-slate-400">GLBA / HIPAA Immutable JSONL Log Viewer</p>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <button
              onClick={handleDownload}
              className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-200 transition"
              title="Download full audit log"
            >
              <Download className="w-3.5 h-3.5" />
              <span>Export Audit</span>
            </button>
            <button onClick={onClose} className="text-slate-500 hover:text-slate-200 p-1 rounded-lg">
              <X className="w-4 h-4" />
            </button>
          </div>
        </div>

        {/* Audit Log Entries */}
        <div className="p-5 overflow-y-auto space-y-3 text-xs flex-1">
          {loading ? (
            <div className="text-center py-8 text-slate-500">Loading audit records...</div>
          ) : logs.length === 0 ? (
            <div className="text-center py-8 text-slate-500">No audit records recorded yet.</div>
          ) : (
            logs.map((log, idx) => (
              <div key={idx} className="p-3.5 rounded-xl bg-slate-950 border border-slate-800/80 space-y-2">
                <div className="flex items-center justify-between flex-wrap gap-2">
                  <div className="flex items-center gap-2">
                    <span className={`text-[10px] font-bold px-2 py-0.5 rounded uppercase ${
                      log.status === 'SUCCESS' 
                        ? 'bg-emerald-950 text-emerald-400 border border-emerald-800'
                        : log.status === 'INSUFFICIENT_INFO'
                        ? 'bg-amber-950 text-amber-400 border border-amber-800'
                        : 'bg-rose-950 text-rose-400 border border-rose-800'
                    }`}>
                      {log.status}
                    </span>
                    <span className="text-[11px] text-slate-400 flex items-center gap-1 font-mono">
                      <Clock className="w-3 h-3 text-slate-500" />
                      {new Date(log.timestamp).toLocaleString()}
                    </span>
                  </div>

                  <div className="flex items-center gap-2 text-[10px] font-mono text-slate-400">
                    <span>Mode: {log.mode}</span>
                    {log.maskedCount > 0 && (
                      <span className="text-emerald-400 font-semibold">
                        🛡️ {log.maskedCount} NPI masked
                      </span>
                    )}
                  </div>
                </div>

                <div className="space-y-1">
                  <p className="font-medium text-slate-200">
                    <span className="text-slate-500 font-mono">Prompt:</span> {log.prompt}
                  </p>
                  {log.sql && (
                    <pre className="p-2 rounded bg-slate-900 font-mono text-[11px] text-emerald-400 overflow-x-auto">
                      {log.sql}
                    </pre>
                  )}
                  {log.error && (
                    <p className="text-[11px] text-amber-400 font-mono">
                      {log.error}
                    </p>
                  )}
                </div>
              </div>
            ))
          )}
        </div>

        {/* Modal Footer */}
        <div className="px-5 py-3 bg-slate-950 border-t border-slate-800 flex justify-end">
          <button
            onClick={onClose}
            className="px-4 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-300 text-xs font-medium transition"
          >
            Close
          </button>
        </div>

      </div>
    </div>
  );
}
