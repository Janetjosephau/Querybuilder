/**
 * Guidewire Insurance Suite Seed Dataset Generator
 * Contains realistic relational data for PolicyCenter (pc_*),
 * BillingCenter (bc_*), and ClaimCenter (cc_*) across Residential and Commercial product lines.
 */

function generateGuidewireData() {
  const policies = [
    // Residential Policies
    { id: 1, policynumber: 'POL-RES-1001', productcode: 'Residential', status: 'In Force', effectivedate: '2024-01-15' },
    { id: 2, policynumber: 'POL-RES-1002', productcode: 'Residential', status: 'In Force', effectivedate: '2024-02-01' },
    { id: 3, policynumber: 'POL-RES-1003', productcode: 'Residential', status: 'Expired', effectivedate: '2023-03-10' },
    { id: 4, policynumber: 'POL-RES-1004', productcode: 'Residential', status: 'In Force', effectivedate: '2024-04-12' },
    { id: 5, policynumber: 'POL-RES-1005', productcode: 'Residential', status: 'Canceled', effectivedate: '2023-11-20' },
    { id: 6, policynumber: 'POL-RES-1006', productcode: 'Residential', status: 'In Force', effectivedate: '2024-05-18' },
    { id: 7, policynumber: 'POL-RES-1007', productcode: 'Residential', status: 'In Force', effectivedate: '2024-06-25' },
    { id: 8, policynumber: 'POL-RES-1008', productcode: 'Residential', status: 'In Force', effectivedate: '2024-07-04' },
    
    // Commercial Policies
    { id: 9, policynumber: 'POL-COM-2001', productcode: 'Commercial', status: 'In Force', effectivedate: '2024-01-01' },
    { id: 10, policynumber: 'POL-COM-2002', productcode: 'Commercial', status: 'In Force', effectivedate: '2024-02-15' },
    { id: 11, policynumber: 'POL-COM-2003', productcode: 'Commercial', status: 'Expired', effectivedate: '2023-01-10' },
    { id: 12, policynumber: 'POL-COM-2004', productcode: 'Commercial', status: 'In Force', effectivedate: '2024-03-01' },
    { id: 13, policynumber: 'POL-COM-2005', productcode: 'Commercial', status: 'In Force', effectivedate: '2024-04-20' },
    { id: 14, policynumber: 'POL-COM-2006', productcode: 'Commercial', status: 'Canceled', effectivedate: '2023-08-15' },
    { id: 15, policynumber: 'POL-COM-2007', productcode: 'Commercial', status: 'In Force', effectivedate: '2024-06-01' },
    { id: 16, policynumber: 'POL-COM-2008', productcode: 'Commercial', status: 'In Force', effectivedate: '2024-08-10' }
  ];

  const policyperiods = [
    { id: 1, policy_id: 1, termnumber: 1, periodstart: '2024-01-15', periodend: '2025-01-15', totalpremium: 1850.00, underwritingcompany: 'Apex Residential Insurance' },
    { id: 2, policy_id: 2, termnumber: 1, periodstart: '2024-02-01', periodend: '2025-02-01', totalpremium: 2100.00, underwritingcompany: 'Apex Residential Insurance' },
    { id: 3, policy_id: 3, termnumber: 2, periodstart: '2023-03-10', periodend: '2024-03-10', totalpremium: 1650.00, underwritingcompany: 'Apex Residential Insurance' },
    { id: 4, policy_id: 4, termnumber: 1, periodstart: '2024-04-12', periodend: '2025-04-12', totalpremium: 2400.00, underwritingcompany: 'Guidewire Mutual Assurance' },
    { id: 5, policy_id: 5, termnumber: 1, periodstart: '2023-11-20', periodend: '2024-11-20', totalpremium: 1400.00, underwritingcompany: 'Apex Residential Insurance' },
    { id: 6, policy_id: 6, termnumber: 1, periodstart: '2024-05-18', periodend: '2025-05-18', totalpremium: 2950.00, underwritingcompany: 'Guidewire Mutual Assurance' },
    { id: 7, policy_id: 7, termnumber: 1, periodstart: '2024-06-25', periodend: '2025-06-25', totalpremium: 1750.00, underwritingcompany: 'Apex Residential Insurance' },
    { id: 8, policy_id: 8, termnumber: 1, periodstart: '2024-07-04', periodend: '2025-07-04', totalpremium: 2200.00, underwritingcompany: 'Guidewire Mutual Assurance' },
    
    { id: 9, policy_id: 9, termnumber: 1, periodstart: '2024-01-01', periodend: '2025-01-01', totalpremium: 24500.00, underwritingcompany: 'Commercial Peak Underwriters' },
    { id: 10, policy_id: 10, termnumber: 1, periodstart: '2024-02-15', periodend: '2025-02-15', totalpremium: 18900.00, underwritingcompany: 'Commercial Peak Underwriters' },
    { id: 11, policy_id: 11, termnumber: 3, periodstart: '2023-01-10', periodend: '2024-01-10', totalpremium: 32000.00, underwritingcompany: 'Commercial Peak Underwriters' },
    { id: 12, policy_id: 12, termnumber: 1, periodstart: '2024-03-01', periodend: '2025-03-01', totalpremium: 45000.00, underwritingcompany: 'Guidewire Mutual Assurance' },
    { id: 13, policy_id: 13, termnumber: 1, periodstart: '2024-04-20', periodend: '2025-04-20', totalpremium: 15400.00, underwritingcompany: 'Commercial Peak Underwriters' },
    { id: 14, policy_id: 14, termnumber: 1, periodstart: '2023-08-15', periodend: '2024-08-15', totalpremium: 27800.00, underwritingcompany: 'Commercial Peak Underwriters' },
    { id: 15, policy_id: 15, termnumber: 1, periodstart: '2024-06-01', periodend: '2025-06-01', totalpremium: 38200.00, underwritingcompany: 'Guidewire Mutual Assurance' },
    { id: 16, policy_id: 16, termnumber: 1, periodstart: '2024-08-10', periodend: '2025-08-10', totalpremium: 52000.00, underwritingcompany: 'Commercial Peak Underwriters' }
  ];

  const coverages = [
    // Residential Coverages
    { id: 1, policyperiod_id: 1, coveragecode: 'COV-DWEL', coveragename: 'Dwelling', limitamount: 450000, deductible: 1500 },
    { id: 2, policyperiod_id: 1, coveragecode: 'COV-PERS', coveragename: 'Personal Property', limitamount: 225000, deductible: 1000 },
    { id: 3, policyperiod_id: 2, coveragecode: 'COV-DWEL', coveragename: 'Dwelling', limitamount: 600000, deductible: 2500 },
    { id: 4, policyperiod_id: 2, coveragecode: 'COV-LIAB', coveragename: 'Personal Liability', limitamount: 500000, deductible: 0 },
    { id: 5, policyperiod_id: 4, coveragecode: 'COV-DWEL', coveragename: 'Dwelling', limitamount: 550000, deductible: 2000 },
    { id: 6, policyperiod_id: 6, coveragecode: 'COV-DWEL', coveragename: 'Dwelling', limitamount: 750000, deductible: 2500 },

    // Commercial Coverages
    { id: 7, policyperiod_id: 9, coveragecode: 'COV-CBLD', coveragename: 'Commercial Building', limitamount: 2500000, deductible: 10000 },
    { id: 8, policyperiod_id: 9, coveragecode: 'COV-BINT', coveragename: 'Business Interruption', limitamount: 750000, deductible: 5000 },
    { id: 9, policyperiod_id: 10, coveragecode: 'COV-GL', coveragename: 'General Liability', limitamount: 2000000, deductible: 2500 },
    { id: 10, policyperiod_id: 12, coveragecode: 'COV-CBLD', coveragename: 'Commercial Building', limitamount: 5000000, deductible: 25000 },
    { id: 11, policyperiod_id: 12, coveragecode: 'COV-BINT', coveragename: 'Business Interruption', limitamount: 1500000, deductible: 10000 },
    { id: 12, policyperiod_id: 15, coveragecode: 'COV-BPP', coveragename: 'Business Personal Property', limitamount: 1200000, deductible: 5000 }
  ];

  // Synthetic NPI policyholders for testing masking
  const policyholders = [
    { id: 1, policyperiod_id: 1, firstname: 'Marcus', lastname: 'Vance', ssn: '458-22-9182', dob: '1982-04-14', address: '742 Evergreen Terrace', city: 'Austin', state: 'TX', postalcode: '78701', email: 'mvance@example.com', phone: '512-555-0149' },
    { id: 2, policyperiod_id: 2, firstname: 'Elena', lastname: 'Rostova', ssn: '192-84-3321', dob: '1976-11-23', address: '1204 Pine Creek Rd', city: 'Dallas', state: 'TX', postalcode: '75201', email: 'elena.rostova@domain.com', phone: '214-555-0182' },
    { id: 3, policyperiod_id: 4, firstname: 'David', lastname: 'Kim', ssn: '603-91-4472', dob: '1989-08-30', address: '882 Sunset Blvd', city: 'Los Angeles', state: 'CA', postalcode: '90028', email: 'dkim@pacificmail.com', phone: '310-555-0193' },
    { id: 4, policyperiod_id: 6, firstname: 'Sarah', lastname: 'Jenkins', ssn: '319-48-5520', dob: '1965-02-17', address: '310 Ocean Ave', city: 'Miami', state: 'FL', postalcode: '33139', email: 'sjenkins@coastal.org', phone: '305-555-0128' },
    { id: 5, policyperiod_id: 9, firstname: 'Robert', lastname: 'Sterling', ssn: '551-73-8891', dob: '1970-09-05', address: '100 Wall Street Ste 400', city: 'New York', state: 'NY', postalcode: '10005', email: 'rsterling@sterlinggroup.com', phone: '212-555-0111' },
    { id: 6, policyperiod_id: 10, firstname: 'Amanda', lastname: 'Chen', ssn: '720-19-4403', dob: '1984-06-12', address: '450 Michigan Ave', city: 'Chicago', state: 'IL', postalcode: '60611', email: 'achen@apexlogistics.com', phone: '312-555-0177' },
    { id: 7, policyperiod_id: 12, firstname: 'Gregory', lastname: 'Holt', ssn: '883-29-1055', dob: '1968-12-01', address: '1800 Market St', city: 'Philadelphia', state: 'PA', postalcode: '19103', email: 'gholt@holtsolutions.com', phone: '215-555-0144' }
  ];

  const accounts = [
    { id: 1, accountnumber: 'BAC-1001', policy_id: 1, billingmethod: 'Direct Bill', paymentplan: 'Monthly 10-Pay' },
    { id: 2, accountnumber: 'BAC-1002', policy_id: 2, billingmethod: 'Direct Bill', paymentplan: 'Annual' },
    { id: 3, accountnumber: 'BAC-1004', policy_id: 4, billingmethod: 'Direct Bill', paymentplan: 'Quarterly' },
    { id: 4, accountnumber: 'BAC-2001', policy_id: 9, billingmethod: 'Agency Bill', paymentplan: 'Annual' },
    { id: 5, accountnumber: 'BAC-2002', policy_id: 10, billingmethod: 'Agency Bill', paymentplan: 'Quarterly' },
    { id: 6, accountnumber: 'BAC-2004', policy_id: 12, billingmethod: 'Agency Bill', paymentplan: 'Monthly 10-Pay' },
    { id: 7, accountnumber: 'BAC-2005', policy_id: 13, billingmethod: 'Direct Bill', paymentplan: 'Annual' }
  ];

  const invoices = [
    { id: 1, account_id: 1, invoicenumber: 'INV-2024-001', invoicedate: '2024-01-15', duedate: '2024-02-15', amount: 185.00, paidamount: 185.00, status: 'Paid' },
    { id: 2, account_id: 1, invoicenumber: 'INV-2024-002', invoicedate: '2024-02-15', duedate: '2024-03-15', amount: 185.00, paidamount: 185.00, status: 'Paid' },
    { id: 3, account_id: 1, invoicenumber: 'INV-2024-003', invoicedate: '2024-03-15', duedate: '2024-04-15', amount: 185.00, paidamount: 0.00, status: 'Past Due' },
    { id: 4, account_id: 2, invoicenumber: 'INV-2024-004', invoicedate: '2024-02-01', duedate: '2024-03-01', amount: 2100.00, paidamount: 2100.00, status: 'Paid' },
    { id: 5, account_id: 3, invoicenumber: 'INV-2024-005', invoicedate: '2024-04-12', duedate: '2024-05-12', amount: 600.00, paidamount: 0.00, status: 'Past Due' },
    { id: 6, account_id: 4, invoicenumber: 'INV-2024-006', invoicedate: '2024-01-01', duedate: '2024-02-01', amount: 24500.00, paidamount: 24500.00, status: 'Paid' },
    { id: 7, account_id: 5, invoicenumber: 'INV-2024-007', invoicedate: '2024-02-15', duedate: '2024-03-15', amount: 4725.00, paidamount: 4725.00, status: 'Paid' },
    { id: 8, account_id: 5, invoicenumber: 'INV-2024-008', invoicedate: '2024-05-15', duedate: '2024-06-15', amount: 4725.00, paidamount: 0.00, status: 'Past Due' },
    { id: 9, account_id: 6, invoicenumber: 'INV-2024-009', invoicedate: '2024-03-01', duedate: '2024-04-01', amount: 4500.00, paidamount: 4500.00, status: 'Paid' }
  ];

  const payments = [
    { id: 1, invoice_id: 1, paymentdate: '2024-02-10', amount: 185.00, paymentmethod: 'ACH', bankaccount_masked: '4829104928192841' },
    { id: 2, invoice_id: 2, paymentdate: '2024-03-12', amount: 185.00, paymentmethod: 'Credit Card', bankaccount_masked: '4111222233334444' },
    { id: 3, invoice_id: 4, paymentdate: '2024-02-28', amount: 2100.00, paymentmethod: 'ACH', bankaccount_masked: '9182736451029384' },
    { id: 4, invoice_id: 6, paymentdate: '2024-01-20', amount: 24500.00, paymentmethod: 'Lockbox', bankaccount_masked: '5520194827103948' },
    { id: 5, invoice_id: 7, paymentdate: '2024-03-05', amount: 4725.00, paymentmethod: 'ACH', bankaccount_masked: '6011928374651029' }
  ];

  const claims = [
    // Residential Claims
    { id: 1, claimnumber: 'CLM-2024-001', policy_id: 1, lossdate: '2024-03-12', reporteddate: '2024-03-14', losscause: 'Water Damage', status: 'Closed', losslocation: 'Austin, TX' },
    { id: 2, claimnumber: 'CLM-2024-002', policy_id: 2, lossdate: '2024-05-20', reporteddate: '2024-05-21', losscause: 'Wind/Hail', status: 'Open', losslocation: 'Dallas, TX' },
    { id: 3, claimnumber: 'CLM-2024-003', policy_id: 4, lossdate: '2024-06-15', reporteddate: '2024-06-18', losscause: 'Fire', status: 'Open', losslocation: 'Los Angeles, CA' },
    { id: 4, claimnumber: 'CLM-2024-004', policy_id: 6, lossdate: '2024-07-02', reporteddate: '2024-07-05', losscause: 'Theft', status: 'Closed', losslocation: 'Miami, FL' },

    // Commercial Claims
    { id: 5, claimnumber: 'CLM-2024-005', policy_id: 9, lossdate: '2024-02-18', reporteddate: '2024-02-20', losscause: 'Water Damage', status: 'Open', losslocation: 'New York, NY' },
    { id: 6, claimnumber: 'CLM-2024-006', policy_id: 10, lossdate: '2024-04-10', reporteddate: '2024-04-11', losscause: 'Liability Claim', status: 'Open', losslocation: 'Chicago, IL' },
    { id: 7, claimnumber: 'CLM-2024-007', policy_id: 12, lossdate: '2024-05-01', reporteddate: '2024-05-02', losscause: 'Fire', status: 'Open', losslocation: 'Philadelphia, PA' },
    { id: 8, claimnumber: 'CLM-2024-008', policy_id: 13, lossdate: '2024-06-30', reporteddate: '2024-07-01', losscause: 'Business Interruption', status: 'Closed', losslocation: 'Houston, TX' }
  ];

  const claimants = [
    { id: 1, claim_id: 1, firstname: 'Marcus', lastname: 'Vance', ssn: '458-22-9182', phone: '512-555-0149', email: 'mvance@example.com', relationshiptopolicyholder: 'Primary Insured' },
    { id: 2, claim_id: 2, firstname: 'Elena', lastname: 'Rostova', ssn: '192-84-3321', phone: '214-555-0182', email: 'elena.rostova@domain.com', relationshiptopolicyholder: 'Primary Insured' },
    { id: 3, claim_id: 3, firstname: 'David', lastname: 'Kim', ssn: '603-91-4472', phone: '310-555-0193', email: 'dkim@pacificmail.com', relationshiptopolicyholder: 'Primary Insured' },
    { id: 4, claim_id: 6, firstname: 'Lucas', lastname: 'Wright', ssn: '902-18-4491', phone: '312-555-0981', email: 'lwright@thirdparty.com', relationshiptopolicyholder: 'Third Party Claimant' },
    { id: 5, claim_id: 7, firstname: 'Gregory', lastname: 'Holt', ssn: '883-29-1055', phone: '215-555-0144', email: 'gholt@holtsolutions.com', relationshiptopolicyholder: 'Primary Insured' }
  ];

  const exposures = [
    { id: 1, claim_id: 1, exposuretype: 'Personal Property Damage', status: 'Closed' },
    { id: 2, claim_id: 2, exposuretype: 'Structure Damage', status: 'Open' },
    { id: 3, claim_id: 3, exposuretype: 'Structure Damage', status: 'Open' },
    { id: 4, claim_id: 4, exposuretype: 'Personal Property Damage', status: 'Closed' },
    { id: 5, claim_id: 5, exposuretype: 'Commercial Property Damage', status: 'Open' },
    { id: 6, claim_id: 6, exposuretype: 'Bodily Injury / Liability', status: 'Open' },
    { id: 7, claim_id: 7, exposuretype: 'Commercial Property Damage', status: 'Open' },
    { id: 8, claim_id: 8, exposuretype: 'Commercial Property Damage', status: 'Closed' }
  ];

  const financials = [
    { id: 1, claim_id: 1, exposure_id: 1, totalreserves: 0.00, totalpaid: 8400.00, recoveries: 500.00, netincurred: 7900.00 },
    { id: 2, claim_id: 2, exposure_id: 2, totalreserves: 35000.00, totalpaid: 4500.00, recoveries: 0.00, netincurred: 39500.00 },
    { id: 3, claim_id: 3, exposure_id: 3, totalreserves: 120000.00, totalpaid: 15000.00, recoveries: 0.00, netincurred: 135000.00 },
    { id: 4, claim_id: 4, exposure_id: 4, totalreserves: 0.00, totalpaid: 3200.00, recoveries: 0.00, netincurred: 3200.00 },
    { id: 5, claim_id: 5, exposure_id: 5, totalreserves: 65000.00, totalpaid: 12000.00, recoveries: 2000.00, netincurred: 75000.00 },
    { id: 6, claim_id: 6, exposure_id: 6, totalreserves: 95000.00, totalpaid: 5000.00, recoveries: 0.00, netincurred: 100000.00 },
    { id: 7, claim_id: 7, exposure_id: 7, totalreserves: 380000.00, totalpaid: 45000.00, recoveries: 0.00, netincurred: 425000.00 },
    { id: 8, claim_id: 8, exposure_id: 8, totalreserves: 0.00, totalpaid: 28000.00, recoveries: 3500.00, netincurred: 24500.00 }
  ];

  return {
    pc_policy: policies,
    pc_policyperiod: policyperiods,
    pc_coverage: coverages,
    pc_policyholder: policyholders,
    bc_account: accounts,
    bc_invoice: invoices,
    bc_payment: payments,
    cc_claim: claims,
    cc_claimant: claimants,
    cc_exposure: exposures,
    cc_financials: financials
  };
}

module.exports = {
  generateGuidewireData
};
