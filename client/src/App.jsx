import React, { useState, useEffect } from 'react';
import Header from './components/Header';
import ChatBox from './components/ChatBox';
import SqlPreview from './components/SqlPreview';
import DataGrid from './components/DataGrid';
import SchemaSidebar from './components/SchemaSidebar';
import ConnectionModal from './components/ConnectionModal';
import AuditModal from './components/AuditModal';
import { PanelLeftClose, PanelLeftOpen, RefreshCw } from 'lucide-react';

export default function App() {
  const [schema, setSchema] = useState(null);
  const [dbMode, setDbMode] = useState('demo');
  const [activeModel, setActiveModel] = useState('qwen2.5-coder:7b');
  const [availableModels, setAvailableModels] = useState(['qwen2.5-coder:7b', 'qwen3:4b', 'qwen:7b', 'llama3:latest', 'mistral:7b']);
  
  const [queryResult, setQueryResult] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isExecutingRaw, setIsExecutingRaw] = useState(false);
  const [error, setError] = useState(null);
  const [insufficientInfo, setInsufficientInfo] = useState(null);
  
  const [isConnectModalOpen, setIsConnectModalOpen] = useState(false);
  const [isAuditModalOpen, setIsAuditModalOpen] = useState(false);
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [npiMaskedTotal, setNpiMaskedTotal] = useState(0);
  const [selectedSuite, setSelectedSuite] = useState(null); // 'pc' | 'bc' | 'cc'

  // Initial load
  useEffect(() => {
    fetchHealthAndSchema();
  }, []);

  const fetchHealthAndSchema = async () => {
    try {
      // 1. Health check
      const healthRes = await fetch('/api/health');
      const health = await healthRes.json();
      setDbMode(health.dbMode || 'demo');
      if (health.activeModel) setActiveModel(health.activeModel);

      // 2. Models
      const modelsRes = await fetch('/api/models');
      const modelsData = await modelsRes.json();
      if (modelsData.models?.length) {
        setAvailableModels(modelsData.models);
      }

      // 3. Schema
      const schemaRes = await fetch('/api/schema');
      const schemaData = await schemaRes.json();
      if (schemaData.success) {
        setSchema(schemaData.schema);
      }
    } catch (err) {
      console.error('Error fetching initial studio state:', err);
    }
  };

  const [currentPrompt, setCurrentPrompt] = useState('');
  const [lastExecutedPrompt, setLastExecutedPrompt] = useState('');
  const [queryRefreshedAt, setQueryRefreshedAt] = useState(null);

  const handleSelectModel = async (model) => {
    try {
      setActiveModel(model);
      await fetch('/api/models/select', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ model })
      });
    } catch (err) {
      console.error('Error selecting model:', err);
    }
  };

  const handleNaturalLanguageQuery = async (promptText, errorFlag) => {
    if (errorFlag === 'NO_SUITE_SELECTED' || !selectedSuite) {
      setError('Please select an application first (PolicyCenter, BillingCenter, or ClaimCenter) to target your query.');
      return;
    }

    setIsLoading(true);
    setCurrentPrompt(promptText);
    setLastExecutedPrompt(promptText);
    setError(null);
    setInsufficientInfo(null);

    try {
      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ prompt: promptText, suite: selectedSuite })
      });

      const data = await res.json();

      if (!res.ok || !data.success) {
        throw new Error(data.error || 'Failed to process query');
      }

      if (data.insufficientInfo) {
        setInsufficientInfo(data.insufficientInfo);
      }

      setQueryResult(data);
      setQueryRefreshedAt(new Date().toLocaleTimeString());

      if (data.maskedCount) {
        setNpiMaskedTotal(prev => prev + data.maskedCount);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setIsLoading(false);
      setCurrentPrompt('');
    }
  };

  const handleRetry = () => {
    if (lastExecutedPrompt) {
      handleNaturalLanguageQuery(lastExecutedPrompt);
    }
  };

  const handleRunRawSql = async (sqlToRun) => {
    setIsExecutingRaw(true);
    setError(null);

    try {
      const res = await fetch('/api/execute', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sql: sqlToRun })
      });

      const data = await res.json();

      if (!res.ok || !data.success) {
        throw new Error(data.error || 'Execution failed');
      }

      setQueryResult(prev => ({
        ...prev,
        sql: data.executedSql,
        rows: data.rows,
        rowCount: data.rowCount,
        executionTimeMs: data.executionTimeMs,
        maskedCount: data.maskedCount,
        maskedFields: data.maskedFields
      }));

      if (data.maskedCount) {
        setNpiMaskedTotal(prev => prev + data.maskedCount);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setIsExecutingRaw(false);
    }
  };

  const handlePreviewTable = (tableName) => {
    const previewSql = `SELECT * FROM ${tableName} LIMIT 10;`;
    handleRunRawSql(previewSql);
  };

  const handleConnect = async (mode, config) => {
    const res = await fetch('/api/connect', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ mode, config })
    });

    const data = await res.json();
    if (!res.ok || !data.success) {
      throw new Error(data.error || 'Connection failed');
    }

    setDbMode(data.mode);
    await fetchHealthAndSchema();
  };

  return (
    <div className="min-h-screen bg-slate-950 text-slate-100 flex flex-col font-sans">
      {/* Top Header */}
      <Header
        dbMode={dbMode}
        activeModel={activeModel}
        availableModels={availableModels}
        onSelectModel={handleSelectModel}
        onOpenConnectModal={() => setIsConnectModalOpen(true)}
        onOpenAuditModal={() => setIsAuditModalOpen(true)}
        npiMaskedTotal={npiMaskedTotal}
      />

      {/* Main Studio Body */}
      <div className="flex-1 flex overflow-hidden">
        
        {/* Collapsible Left Schema Sidebar */}
        {isSidebarOpen && (
          <SchemaSidebar
            schema={schema}
            onSelectTable={handlePreviewTable}
            selectedSuite={selectedSuite}
          />
        )}

        {/* Content Workspace (Right Side Panel: White Background) */}
        <main className="flex-1 overflow-y-auto p-4 md:p-6 space-y-5 bg-white text-slate-800">
          
          {/* Top Bar with Sidebar Toggle, 3 App Radio Buttons, & Refresh */}
          <div className="flex flex-wrap items-center justify-between gap-3 pb-2 border-b border-slate-100">
            <div className="flex items-center gap-2">
              <button
                onClick={() => setIsSidebarOpen(!isSidebarOpen)}
                className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-100 hover:bg-slate-200 border border-slate-200 text-slate-700 hover:text-slate-900 text-xs font-medium transition shadow-sm"
                title={isSidebarOpen ? 'Hide Schema Explorer' : 'Show Schema Explorer'}
              >
                {isSidebarOpen ? <PanelLeftClose className="w-4 h-4" /> : <PanelLeftOpen className="w-4 h-4" />}
                <span>{isSidebarOpen ? 'Hide Schema Catalog' : 'Show Schema Catalog'}</span>
              </button>
            </div>

            {/* Right group: 3 Radio Buttons for Guidewire Application Suite + Refresh Schema */}
            <div className="flex items-center flex-wrap gap-2.5">
              <div className={`flex items-center gap-1.5 px-2.5 py-1 rounded-xl border text-xs shadow-sm transition ${
                !selectedSuite ? 'bg-amber-50/70 border-amber-300 ring-2 ring-amber-400/30' : 'bg-slate-50 border-slate-200'
              }`}>
                <span className={`text-[11px] font-bold uppercase tracking-wider mr-1 ${
                  !selectedSuite ? 'text-amber-800' : 'text-slate-500'
                }`}>
                  {!selectedSuite ? 'Select Application:' : 'App:'}
                </span>
                
                {/* 1. PolicyCenter */}
                <label className={`flex items-center gap-1.5 px-2.5 py-1 rounded-lg cursor-pointer text-xs font-medium transition select-none ${
                  selectedSuite === 'pc' 
                    ? 'bg-sky-600 text-white shadow-sm ring-1 ring-sky-500 font-semibold' 
                    : 'text-slate-700 hover:text-slate-900 hover:bg-slate-200/70'
                }`}>
                  <input
                    type="radio"
                    name="guidewireApplication"
                    value="pc"
                    checked={selectedSuite === 'pc'}
                    onChange={() => { setSelectedSuite('pc'); setError(null); }}
                    className="accent-sky-600 w-3.5 h-3.5 cursor-pointer"
                  />
                  <span>PolicyCenter</span>
                  <span className={`text-[10px] px-1 py-0.2 rounded font-mono ${selectedSuite === 'pc' ? 'bg-sky-700 text-sky-100' : 'bg-slate-200 text-slate-600'}`} title="pc_*, pcst_*, pctl_*, pcx_*">pc*</span>
                </label>

                {/* 2. BillingCenter */}
                <label className={`flex items-center gap-1.5 px-2.5 py-1 rounded-lg cursor-pointer text-xs font-medium transition select-none ${
                  selectedSuite === 'bc' 
                    ? 'bg-indigo-600 text-white shadow-sm ring-1 ring-indigo-500 font-semibold' 
                    : 'text-slate-700 hover:text-slate-900 hover:bg-slate-200/70'
                }`}>
                  <input
                    type="radio"
                    name="guidewireApplication"
                    value="bc"
                    checked={selectedSuite === 'bc'}
                    onChange={() => { setSelectedSuite('bc'); setError(null); }}
                    className="accent-indigo-600 w-3.5 h-3.5 cursor-pointer"
                  />
                  <span>BillingCenter</span>
                  <span className={`text-[10px] px-1 py-0.2 rounded font-mono ${selectedSuite === 'bc' ? 'bg-indigo-700 text-indigo-100' : 'bg-slate-200 text-slate-600'}`} title="bc_*, bcst_*, bctl_*, bcx_*">bc*</span>
                </label>

                {/* 3. ClaimCenter */}
                <label className={`flex items-center gap-1.5 px-2.5 py-1 rounded-lg cursor-pointer text-xs font-medium transition select-none ${
                  selectedSuite === 'cc' 
                    ? 'bg-amber-600 text-white shadow-sm ring-1 ring-amber-500 font-semibold' 
                    : 'text-slate-700 hover:text-slate-900 hover:bg-slate-200/70'
                }`}>
                  <input
                    type="radio"
                    name="guidewireApplication"
                    value="cc"
                    checked={selectedSuite === 'cc'}
                    onChange={() => { setSelectedSuite('cc'); setError(null); }}
                    className="accent-amber-600 w-3.5 h-3.5 cursor-pointer"
                  />
                  <span>ClaimCenter</span>
                  <span className={`text-[10px] px-1 py-0.2 rounded font-mono ${selectedSuite === 'cc' ? 'bg-amber-700 text-amber-100' : 'bg-slate-200 text-slate-600'}`} title="cc_*, ccst_*, cctl_*, ccx_*">cc*</span>
                </label>
              </div>

              {/* Refresh Schema Button */}
              <button
                onClick={fetchHealthAndSchema}
                className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-xl bg-slate-100 hover:bg-slate-200 border border-slate-200 text-slate-700 hover:text-slate-900 font-medium transition shadow-sm"
                title="Refresh Schema & Database Status"
              >
                <RefreshCw className="w-3.5 h-3.5" />
                <span>Refresh Schema</span>
              </button>
            </div>
          </div>

          {/* Natural Language Query Box */}
          <ChatBox
            onSubmit={handleNaturalLanguageQuery}
            isLoading={isLoading}
            error={error}
            insufficientInfo={insufficientInfo}
            onRetry={handleRetry}
            lastPrompt={lastExecutedPrompt}
            selectedSuite={selectedSuite}
          />

          {/* Generated SQL Preview Card */}
          {(queryResult?.sql || isLoading) && (
            <SqlPreview
              sql={queryResult?.sql}
              explanation={queryResult?.explanation}
              confidence={queryResult?.confidence}
              onRunSql={handleRunRawSql}
              isExecuting={isExecutingRaw}
              isLoading={isLoading}
              activePrompt={currentPrompt}
              refreshedAt={queryRefreshedAt}
            />
          )}

          {/* Data Grid Table */}
          <DataGrid
            rows={queryResult?.rows || []}
            rowCount={queryResult?.rowCount || 0}
            executionTimeMs={queryResult?.executionTimeMs || 0}
            maskedCount={queryResult?.maskedCount || 0}
            maskedFields={queryResult?.maskedFields || []}
          />
        </main>
      </div>

      {/* Modals */}
      <ConnectionModal
        isOpen={isConnectModalOpen}
        onClose={() => setIsConnectModalOpen(false)}
        currentMode={dbMode}
        onConnect={handleConnect}
      />

      <AuditModal
        isOpen={isAuditModalOpen}
        onClose={() => setIsAuditModalOpen(false)}
      />
    </div>
  );
}
