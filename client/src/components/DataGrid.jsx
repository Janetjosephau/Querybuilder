import React, { useState, useMemo } from 'react';
import { Table, Download, Search, Shield, ArrowUpDown, ChevronLeft, ChevronRight, FileSpreadsheet } from 'lucide-react';

export default function DataGrid({ rows = [], rowCount = 0, executionTimeMs = 0, maskedCount = 0, maskedFields = [] }) {
  const [searchTerm, setSearchTerm] = useState('');
  const [sortCol, setSortCol] = useState(null);
  const [sortAsc, setSortAsc] = useState(true);
  const [page, setPage] = useState(0);
  const pageSize = 10;

  const columns = useMemo(() => {
    if (!rows || rows.length === 0) return [];
    return Object.keys(rows[0]);
  }, [rows]);

  // Filter rows by search term
  const filteredRows = useMemo(() => {
    if (!searchTerm.trim()) return rows;
    const term = searchTerm.toLowerCase();
    return rows.filter(row => 
      Object.values(row).some(val => 
        String(val).toLowerCase().includes(term)
      )
    );
  }, [rows, searchTerm]);

  // Sort rows
  const sortedRows = useMemo(() => {
    if (!sortCol) return filteredRows;
    return [...filteredRows].sort((a, b) => {
      const valA = a[sortCol];
      const valB = b[sortCol];
      if (valA === valB) return 0;
      if (valA === null || valA === undefined) return 1;
      if (valB === null || valB === undefined) return -1;
      
      if (typeof valA === 'number' && typeof valB === 'number') {
        return sortAsc ? valA - valB : valB - valA;
      }
      return sortAsc 
        ? String(valA).localeCompare(String(valB)) 
        : String(valB).localeCompare(String(valA));
    });
  }, [filteredRows, sortCol, sortAsc]);

  // Pagination
  const totalPages = Math.ceil(sortedRows.length / pageSize) || 1;
  const paginatedRows = useMemo(() => {
    const start = page * pageSize;
    return sortedRows.slice(start, start + pageSize);
  }, [sortedRows, page]);

  const handleSort = (col) => {
    if (sortCol === col) {
      setSortAsc(!sortAsc);
    } else {
      setSortCol(col);
      setSortAsc(true);
    }
  };

  // Export to CSV
  const handleExportCsv = () => {
    if (!rows.length) return;
    const headers = columns.join(',');
    const csvLines = rows.map(r => 
      columns.map(col => {
        const cell = String(r[col] ?? '');
        return `"${cell.replace(/"/g, '""')}"`;
      }).join(',')
    );
    const blob = new Blob([[headers, ...csvLines].join('\n')], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `guidewire_query_results_${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    URL.revokeObjectURL(url);
  };

  // Export to JSON
  const handleExportJson = () => {
    if (!rows.length) return;
    const blob = new Blob([JSON.stringify(rows, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `guidewire_query_results_${new Date().toISOString().slice(0, 10)}.json`;
    a.click();
    URL.revokeObjectURL(url);
  };

  if (!rows || rows.length === 0) {
    return (
      <div className="p-8 text-center rounded-2xl bg-white border border-slate-200 text-slate-500 shadow-sm space-y-2">
        <Table className="w-8 h-8 mx-auto text-slate-400" />
        <p className="text-sm">No query results yet. Ask a question above to inspect Guidewire data.</p>
      </div>
    );
  }

  return (
    <div className="rounded-2xl bg-white border border-slate-200 shadow-sm overflow-hidden space-y-3 p-4">
      {/* Table Toolbar */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div className="flex items-center gap-3">
          <div className="flex items-center gap-2">
            <Table className="w-4 h-4 text-emerald-600" />
            <h3 className="font-bold text-xs text-slate-800">Query Results</h3>
            <span className="px-2 py-0.5 rounded-full bg-slate-100 text-[10px] text-slate-600 font-mono border border-slate-200">
              {rowCount} rows • {executionTimeMs}ms
            </span>
          </div>

          {/* Masking telemetry badge */}
          {maskedCount > 0 && (
            <div className="flex items-center gap-1.5 px-2.5 py-0.5 rounded-full bg-emerald-50 border border-emerald-200 text-[11px] text-emerald-800 font-medium">
              <Shield className="w-3 h-3 text-emerald-600" />
              <span>{maskedCount} NPI values protected ({maskedFields.join(', ')})</span>
            </div>
          )}
        </div>

        {/* Search & Export Buttons */}
        <div className="flex items-center gap-2">
          <div className="relative">
            <Search className="w-3.5 h-3.5 text-slate-400 absolute left-2.5 top-2.5" />
            <input
              type="text"
              value={searchTerm}
              onChange={(e) => { setSearchTerm(e.target.value); setPage(0); }}
              placeholder="Search table..."
              className="bg-slate-50 border border-slate-200 rounded-lg pl-8 pr-3 py-1 text-xs text-slate-800 placeholder-slate-400 focus:outline-none focus:border-emerald-500 focus:bg-white w-36 sm:w-48 transition"
            />
          </div>

          <button
            onClick={handleExportCsv}
            className="flex items-center gap-1 text-xs px-2.5 py-1.5 rounded-lg bg-white hover:bg-slate-100 text-slate-700 border border-slate-200 shadow-sm transition"
            title="Export CSV with masked data"
          >
            <FileSpreadsheet className="w-3.5 h-3.5 text-emerald-600" />
            <span>CSV</span>
          </button>

          <button
            onClick={handleExportJson}
            className="flex items-center gap-1 text-xs px-2.5 py-1.5 rounded-lg bg-white hover:bg-slate-100 text-slate-700 border border-slate-200 shadow-sm transition"
            title="Export JSON"
          >
            <Download className="w-3.5 h-3.5 text-slate-500" />
            <span>JSON</span>
          </button>
        </div>
      </div>

      {/* Interactive Table */}
      <div className="overflow-x-auto rounded-xl border border-slate-200 shadow-2xs">
        <table className="w-full text-left text-xs border-collapse">
          <thead>
            <tr className="bg-slate-50 border-b border-slate-200">
              {columns.map(col => {
                const isMaskedField = maskedFields.includes(col);
                return (
                  <th
                    key={col}
                    onClick={() => handleSort(col)}
                    className="p-3 font-bold text-slate-700 cursor-pointer hover:bg-slate-100 select-none whitespace-nowrap transition"
                  >
                    <div className="flex items-center gap-1.5">
                      <span>{col}</span>
                      {isMaskedField && (
                        <span className="text-[9px] px-1 py-0.2 rounded bg-emerald-100 text-emerald-800 border border-emerald-300 font-bold" title="NPI Protected Field">
                          MASKED
                        </span>
                      )}
                      <ArrowUpDown className="w-3 h-3 text-slate-400" />
                    </div>
                  </th>
                );
              })}
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {paginatedRows.map((row, rIdx) => (
              <tr key={rIdx} className="hover:bg-slate-50/80 transition">
                {columns.map(col => {
                  const val = row[col];
                  const isMasked = typeof val === 'string' && (val.includes('***') || maskedFields.includes(col));
                  return (
                    <td key={col} className="p-3 whitespace-nowrap font-mono text-slate-800 text-xs">
                      {isMasked ? (
                        <span className="inline-flex items-center gap-1 px-1.5 py-0.5 rounded bg-emerald-50 border border-emerald-200 text-emerald-700 font-medium text-[11px]">
                          <Shield className="w-2.5 h-2.5 text-emerald-600" />
                          {String(val)}
                        </span>
                      ) : val === null || val === undefined ? (
                        <span className="text-slate-400 italic">null</span>
                      ) : typeof val === 'number' ? (
                        <span className="text-indigo-700 font-semibold">{val.toLocaleString()}</span>
                      ) : (
                        String(val)
                      )}
                    </td>
                  );
                })}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Pagination Footer */}
      <div className="flex items-center justify-between text-xs text-slate-500 pt-1">
        <div>
          Showing {sortedRows.length === 0 ? 0 : page * pageSize + 1} to {Math.min((page + 1) * pageSize, sortedRows.length)} of {sortedRows.length} entries
        </div>
        <div className="flex items-center gap-1.5">
          <button
            onClick={() => setPage(p => Math.max(0, p - 1))}
            disabled={page === 0}
            className="p-1.5 rounded-lg bg-white hover:bg-slate-100 disabled:opacity-40 disabled:cursor-not-allowed text-slate-700 border border-slate-200 shadow-sm transition"
          >
            <ChevronLeft className="w-4 h-4" />
          </button>
          <span className="px-2 font-mono font-semibold text-slate-700">
            {page + 1} / {totalPages}
          </span>
          <button
            onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))}
            disabled={page >= totalPages - 1}
            className="p-1.5 rounded-lg bg-white hover:bg-slate-100 disabled:opacity-40 disabled:cursor-not-allowed text-slate-700 border border-slate-200 shadow-sm transition"
          >
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>
      </div>
    </div>
  );
}
