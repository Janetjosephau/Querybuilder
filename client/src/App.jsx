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
  const [availableModels, setAvailableModels] = useState(['qwen2.5-coder:7b', 'llama3:latest', 'mistral:7b']);
  
  const [queryResult, setQueryResult] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isExecutingRaw, setIsExecutingRaw] = useState(false);
  const [error, setError] = useState(null);
  const [insufficientInfo, setInsufficientInfo] = useState(null);
  
  const [isConnectModalOpen, setIsConnectModalOpen] = useState(false);
  const [isAuditModalOpen, setIsAuditModalOpen] = useState(false);
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [npiMaskedTotal, setNpiMaskedTotal] = useState(0);

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

  const handleNaturalLanguageQuery = async (promptText) => {
    setIsLoading(true);
    setCurrentPrompt(promptText);
    setLastExecutedPrompt(promptText);
    setError(null);
    setInsufficientInfo(null);

    try {
      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ prompt: promptText })
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
          />
        )}

        {/* Content Workspace (Right Side Panel: White Background) */}
        <main className="flex-1 overflow-y-auto p-4 md:p-6 space-y-5 bg-white text-slate-800">
          
          {/* Top Bar with Sidebar Toggle & Refresh */}
          <div className="flex items-center justify-between pb-1">
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

            <button
              onClick={fetchHealthAndSchema}
              className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-xl bg-slate-100 hover:bg-slate-200 border border-slate-200 text-slate-700 hover:text-slate-900 font-medium transition shadow-sm"
              title="Refresh Schema & Database Status"
            >
              <RefreshCw className="w-3.5 h-3.5" />
              <span>Refresh Schema</span>
            </button>
          </div>

          {/* Natural Language Query Box */}
          <ChatBox
            onSubmit={handleNaturalLanguageQuery}
            isLoading={isLoading}
            error={error}
            insufficientInfo={insufficientInfo}
            onRetry={handleRetry}
            lastPrompt={lastExecutedPrompt}
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
