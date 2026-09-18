/**
 * Synthetic Seed Data for TWIA Guidewire BillingCenter QA02
 * Conforms strictly to schema extracted from dump-twia_gwcppre_qa02_bc-202609181333.sql
 */

function generateTwiaBillingData() {
  const accounts = [
    {
      id: 1,
      publicid: 'bc:acc:1001',
      accountnumber: 'BC-TWIA-800101',
      accountname: 'Galveston Coastal Resort LLC',
      accounttype: 'Commercial Property',
      fein: '74-3298142',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Account',
      segment: 'Commercial Lines',
      servicetier: 'Tier 1 - Premier',
      createtime: '2025-01-15 09:30:00'
    },
    {
      id: 2,
      publicid: 'bc:acc:1002',
      accountnumber: 'BC-TWIA-800102',
      accountname: 'Corpus Christi Bay Marina',
      accounttype: 'Commercial Marine',
      fein: '74-8819203',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Account',
      segment: 'Commercial Lines',
      servicetier: 'Tier 1 - Premier',
      createtime: '2025-02-10 14:15:00'
    },
    {
      id: 3,
      publicid: 'bc:acc:1003',
      accountnumber: 'BC-TWIA-800103',
      accountname: 'Vance Family Beach Home',
      accounttype: 'Residential Dwelling',
      fein: '458-22-9182',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Policy',
      segment: 'Personal Lines',
      servicetier: 'Standard',
      createtime: '2025-03-01 11:20:00'
    },
    {
      id: 4,
      publicid: 'bc:acc:1004',
      accountnumber: 'BC-TWIA-800104',
      accountname: 'Port Arthur Logistics Hub',
      accounttype: 'Industrial Property',
      fein: '75-1928472',
      delinquencystatus: 'Past Due (14 Days)',
      currency: 'USD',
      billinglevel: 'Account',
      segment: 'Commercial Lines',
      servicetier: 'Tier 2',
      createtime: '2025-03-12 16:45:00'
    },
    {
      id: 5,
      publicid: 'bc:acc:1005',
      accountnumber: 'BC-TWIA-800105',
      accountname: 'Padre Island Hospitality Group',
      accounttype: 'Commercial Hotel',
      fein: '74-6019384',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Account',
      segment: 'Commercial Lines',
      servicetier: 'Tier 1 - Premier',
      createtime: '2025-04-05 10:10:00'
    },
    {
      id: 6,
      publicid: 'bc:acc:1006',
      accountnumber: 'BC-TWIA-800106',
      accountname: 'Elena Rostova Residence',
      accounttype: 'Residential Dwelling',
      fein: '192-84-3321',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Policy',
      segment: 'Personal Lines',
      servicetier: 'Standard',
      createtime: '2025-04-18 13:30:00'
    },
    {
      id: 7,
      publicid: 'bc:acc:1007',
      accountnumber: 'BC-TWIA-800107',
      accountname: 'Beaumont Cold Storage Warehouses',
      accounttype: 'Commercial Warehouse',
      fein: '76-4820193',
      delinquencystatus: 'In Delinquency (60+ Days)',
      currency: 'USD',
      billinglevel: 'Account',
      segment: 'Commercial Lines',
      servicetier: 'Tier 3',
      createtime: '2025-05-02 08:20:00'
    },
    {
      id: 8,
      publicid: 'bc:acc:1008',
      accountnumber: 'BC-TWIA-800108',
      accountname: 'David & Jennifer Kim Seaside Cottage',
      accounttype: 'Residential Dwelling',
      fein: '603-91-4472',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Policy',
      segment: 'Personal Lines',
      servicetier: 'Standard',
      createtime: '2025-05-20 15:40:00'
    },
    {
      id: 9,
      publicid: 'bc:acc:1009',
      accountnumber: 'BC-TWIA-800109',
      accountname: 'Rockport Harbor Seafood Processing',
      accounttype: 'Commercial Food Processing',
      fein: '74-5501928',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Account',
      segment: 'Commercial Lines',
      servicetier: 'Tier 2',
      createtime: '2025-06-01 10:00:00'
    },
    {
      id: 10,
      publicid: 'bc:acc:1010',
      accountnumber: 'BC-TWIA-800110',
      accountname: 'Sarah Jenkins Coastal Retreat',
      accounttype: 'Residential Dwelling',
      fein: '319-48-5520',
      delinquencystatus: 'Good Standing',
      currency: 'USD',
      billinglevel: 'Policy',
      segment: 'Personal Lines',
      servicetier: 'Standard',
      createtime: '2025-06-15 12:00:00'
    }
  ];

  const invoices = [
    {
      id: 1,
      publicid: 'bc:inv:2001',
      accountid: 1,
      invoicenumber: 'INV-TWIA-2025-001',
      amount: 14500.00,
      amountdue: 0.00,
      netamountpaid: 14500.00,
      outstandingamount: 0.00,
      status: 'Paid',
      paymentduedate: '2025-02-15',
      currency: 'USD',
      description: 'Annual Windstorm & Hail Commercial Policy Term 2025'
    },
    {
      id: 2,
      publicid: 'bc:inv:2002',
      accountid: 1,
      invoicenumber: 'INV-TWIA-2025-002',
      amount: 7250.00,
      amountdue: 7250.00,
      netamountpaid: 0.00,
      outstandingamount: 7250.00,
      status: 'Billed',
      paymentduedate: '2025-08-15',
      currency: 'USD',
      description: 'Commercial Term Installment #2'
    },
    {
      id: 3,
      publicid: 'bc:inv:2003',
      accountid: 2,
      invoicenumber: 'INV-TWIA-2025-003',
      amount: 18200.00,
      amountdue: 0.00,
      netamountpaid: 18200.00,
      outstandingamount: 0.00,
      status: 'Paid',
      paymentduedate: '2025-03-10',
      currency: 'USD',
      description: 'Marine Facility Windstorm Coverage Term Premium'
    },
    {
      id: 4,
      publicid: 'bc:inv:2004',
      accountid: 3,
      invoicenumber: 'INV-TWIA-2025-004',
      amount: 2450.00,
      amountdue: 0.00,
      netamountpaid: 2450.00,
      outstandingamount: 0.00,
      status: 'Paid',
      paymentduedate: '2025-04-01',
      currency: 'USD',
      description: 'Residential Dwelling Windstorm Term 2025-2026'
    },
    {
      id: 5,
      publicid: 'bc:inv:2005',
      accountid: 4,
      invoicenumber: 'INV-TWIA-2025-005',
      amount: 9800.00,
      amountdue: 9800.00,
      netamountpaid: 0.00,
      outstandingamount: 9800.00,
      status: 'PastDue',
      paymentduedate: '2025-04-12',
      currency: 'USD',
      description: 'Logistics Facility Semi-Annual Premium Installment'
    },
    {
      id: 6,
      publicid: 'bc:inv:2006',
      accountid: 5,
      invoicenumber: 'INV-TWIA-2025-006',
      amount: 22400.00,
      amountdue: 0.00,
      netamountpaid: 22400.00,
      outstandingamount: 0.00,
      status: 'Paid',
      paymentduedate: '2025-05-05',
      currency: 'USD',
      description: 'Resort Hotel Complex Windstorm Term Premium'
    },
    {
      id: 7,
      publicid: 'bc:inv:2007',
      accountid: 6,
      invoicenumber: 'INV-TWIA-2025-007',
      amount: 3100.00,
      amountdue: 0.00,
      netamountpaid: 3100.00,
      outstandingamount: 0.00,
      status: 'Paid',
      paymentduedate: '2025-05-18',
      currency: 'USD',
      description: 'Residential Windstorm & Hail Annual Policy'
    },
    {
      id: 8,
      publicid: 'bc:inv:2008',
      accountid: 7,
      invoicenumber: 'INV-TWIA-2025-008',
      amount: 16800.00,
      amountdue: 16800.00,
      netamountpaid: 0.00,
      outstandingamount: 16800.00,
      status: 'PastDue',
      paymentduedate: '2025-06-02',
      currency: 'USD',
      description: 'Cold Storage Facility Delinquent Installment'
    },
    {
      id: 9,
      publicid: 'bc:inv:2009',
      accountid: 8,
      invoicenumber: 'INV-TWIA-2025-009',
      amount: 2800.00,
      amountdue: 2800.00,
      netamountpaid: 0.00,
      outstandingamount: 2800.00,
      status: 'Billed',
      paymentduedate: '2025-06-20',
      currency: 'USD',
      description: 'Personal Lines Cottage Renewal Billing'
    },
    {
      id: 10,
      publicid: 'bc:inv:2010',
      accountid: 9,
      invoicenumber: 'INV-TWIA-2025-010',
      amount: 12600.00,
      amountdue: 0.00,
      netamountpaid: 12600.00,
      outstandingamount: 0.00,
      status: 'Paid',
      paymentduedate: '2025-07-01',
      currency: 'USD',
      description: 'Seafood Processing Plant First Half Installment'
    }
  ];

  const contacts = [
    {
      id: 1,
      publicid: 'bc:cont:3001',
      firstname: 'Marcus',
      lastname: 'Vance',
      name: 'Marcus Vance',
      taxid: '458-22-9182',
      cellphone: '512-555-0149',
      homephone: '512-555-0150',
      workphone: '512-555-0151',
      emailaddress1: 'mvance@galvestonproperties.com',
      dateofbirth: '1982-04-14',
      occupation: 'Managing Director'
    },
    {
      id: 2,
      publicid: 'bc:cont:3002',
      firstname: 'Elena',
      lastname: 'Rostova',
      name: 'Elena Rostova',
      taxid: '192-84-3321',
      cellphone: '214-555-0182',
      homephone: '214-555-0183',
      workphone: '214-555-0184',
      emailaddress1: 'elena.rostova@domain.com',
      dateofbirth: '1976-11-23',
      occupation: 'Chief Operating Officer'
    },
    {
      id: 3,
      publicid: 'bc:cont:3003',
      firstname: 'David',
      lastname: 'Kim',
      name: 'David Kim',
      taxid: '603-91-4472',
      cellphone: '310-555-0193',
      homephone: '310-555-0194',
      workphone: '310-555-0195',
      emailaddress1: 'dkim@pacificmail.com',
      dateofbirth: '1989-08-30',
      occupation: 'Senior Logistics Specialist'
    },
    {
      id: 4,
      publicid: 'bc:cont:3004',
      firstname: 'Sarah',
      lastname: 'Jenkins',
      name: 'Sarah Jenkins',
      taxid: '319-48-5520',
      cellphone: '305-555-0128',
      homephone: '305-555-0129',
      workphone: '305-555-0130',
      emailaddress1: 'sjenkins@coastal.org',
      dateofbirth: '1965-02-17',
      occupation: 'Marina Director'
    },
    {
      id: 5,
      publicid: 'bc:cont:3005',
      firstname: 'Robert',
      lastname: 'Sterling',
      name: 'Robert Sterling',
      taxid: '551-73-8891',
      cellphone: '212-555-0111',
      homephone: '212-555-0112',
      workphone: '212-555-0113',
      emailaddress1: 'rsterling@sterlinggroup.com',
      dateofbirth: '1970-09-05',
      occupation: 'Real Estate Developer'
    }
  ];

  const paymentInstruments = [
    {
      id: 1,
      publicid: 'bc:pi:4001',
      accountid: 1,
      paymentmethod: 'ACH',
      accountnumber_ext: '982148201948',
      routingnumber_ext: '111000025',
      bankaccounttype_ext: 'Commercial Checking',
      description: 'Wells Fargo Corporate Auto-Debit'
    },
    {
      id: 2,
      publicid: 'bc:pi:4002',
      accountid: 2,
      paymentmethod: 'ACH',
      accountnumber_ext: '550192847291',
      routingnumber_ext: '111900659',
      bankaccounttype_ext: 'Commercial Checking',
      description: 'Chase Commercial Operating Account'
    },
    {
      id: 3,
      publicid: 'bc:pi:4003',
      accountid: 3,
      paymentmethod: 'CreditCard',
      accountnumber_ext: '4111222233334589',
      routingnumber_ext: '000000000',
      bankaccounttype_ext: 'Visa Platinum',
      description: 'Personal Visa AutoPay'
    },
    {
      id: 4,
      publicid: 'bc:pi:4004',
      accountid: 5,
      paymentmethod: 'ACH',
      accountnumber_ext: '772910482014',
      routingnumber_ext: '111000025',
      bankaccounttype_ext: 'Commercial Checking',
      description: 'Bank of America Treasury Direct'
    },
    {
      id: 5,
      publicid: 'bc:pi:4005',
      accountid: 6,
      paymentmethod: 'CreditCard',
      accountnumber_ext: '5500192847192837',
      routingnumber_ext: '000000000',
      bankaccounttype_ext: 'Mastercard Executive',
      description: 'Personal Mastercard'
    }
  ];

  const moneyReceived = [
    {
      id: 1,
      publicid: 'bc:mr:5001',
      accountid: 1,
      invoiceid: 1,
      amount: 14500.00,
      currency: 'USD',
      receiveddate: '2025-02-12',
      refnumber: 'TXN-ACH-891024',
      description: 'Full Payment for INV-TWIA-2025-001',
      paymentinstrumentid: 1
    },
    {
      id: 2,
      publicid: 'bc:mr:5002',
      accountid: 2,
      invoiceid: 3,
      amount: 18200.00,
      currency: 'USD',
      receiveddate: '2025-03-08',
      refnumber: 'TXN-ACH-892155',
      description: 'Full Payment for INV-TWIA-2025-003',
      paymentinstrumentid: 2
    },
    {
      id: 3,
      publicid: 'bc:mr:5003',
      accountid: 3,
      invoiceid: 4,
      amount: 2450.00,
      currency: 'USD',
      receiveddate: '2025-03-29',
      refnumber: 'TXN-CC-771920',
      description: 'Online Credit Card Payment for INV-TWIA-2025-004',
      paymentinstrumentid: 3
    },
    {
      id: 4,
      publicid: 'bc:mr:5004',
      accountid: 5,
      invoiceid: 6,
      amount: 22400.00,
      currency: 'USD',
      receiveddate: '2025-05-02',
      refnumber: 'TXN-ACH-904128',
      description: 'Wire Transfer Payment for INV-TWIA-2025-006',
      paymentinstrumentid: 4
    },
    {
      id: 5,
      publicid: 'bc:mr:5005',
      accountid: 6,
      invoiceid: 7,
      amount: 3100.00,
      currency: 'USD',
      receiveddate: '2025-05-15',
      refnumber: 'TXN-CC-782019',
      description: 'Online Portal Payment for INV-TWIA-2025-007',
      paymentinstrumentid: 5
    }
  ];

  const producers = [
    {
      id: 1,
      publicid: 'bc:prod:6001',
      name: 'Texas Coastal Underwriting Agency',
      namedenorm: 'texas coastal underwriting agency',
      totalcommissionexpense: 42800.00,
      currency: 'USD'
    },
    {
      id: 2,
      publicid: 'bc:prod:6002',
      name: 'Gulf Coast Marine & Property Insurance Brokers',
      namedenorm: 'gulf coast marine property insurance brokers',
      totalcommissionexpense: 65400.00,
      currency: 'USD'
    },
    {
      id: 3,
      publicid: 'bc:prod:6003',
      name: 'Lone Star Windstorm Insurance Group',
      namedenorm: 'lone star windstorm insurance group',
      totalcommissionexpense: 31200.00,
      currency: 'USD'
    },
    {
      id: 4,
      publicid: 'bc:prod:6004',
      name: 'Corpus Christi Commercial Partners',
      namedenorm: 'corpus christi commercial partners',
      totalcommissionexpense: 19800.00,
      currency: 'USD'
    }
  ];

  const paymentPlans = [
    { id: 1, publicid: 'bc:plan:7001', accountid: 1, paymentplanid: 101, currency: 'USD' },
    { id: 2, publicid: 'bc:plan:7002', accountid: 2, paymentplanid: 102, currency: 'USD' },
    { id: 3, publicid: 'bc:plan:7003', accountid: 3, paymentplanid: 103, currency: 'USD' },
    { id: 4, publicid: 'bc:plan:7004', accountid: 4, paymentplanid: 102, currency: 'USD' },
    { id: 5, publicid: 'bc:plan:7005', accountid: 5, paymentplanid: 101, currency: 'USD' }
  ];

  return {
    bc_account: accounts,
    bc_invoice: invoices,
    bc_contact: contacts,
    bc_paymentinstrument: paymentInstruments,
    bc_basemoneyreceived: moneyReceived,
    bc_producer: producers,
    bc_accountpaymentplan: paymentPlans
  };
}

module.exports = {
  generateTwiaBillingData
};
