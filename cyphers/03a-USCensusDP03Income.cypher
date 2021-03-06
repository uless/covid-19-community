USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP03IncomeAdmin2.csv' AS row 
MERGE (i:Income{id: 'ACSDP5Y2018.DP03-' + row.stateFips + '-' + row.countyFips})
SET i.name = 'Income-' + row.stateFips + '-' + row.countyFips,
    i.totalHouseholds = toInteger(row.totalHouseholds),
    i.householdIncomeLessThan10000USD = toInteger(row.householdIncomeLessThan10000USD),
    i.householdIncomeLessThan10000USDPct = toFloat(row.householdIncomeLessThan10000USDPct),
    i.householdIncome10000To14999USD = toInteger(row.householdIncome10000To14999USD),
    i.householdIncome10000To14999USDPct = toFloat(row.householdIncome10000To14999USDPct),
    i.householdIncome15000To24999USD = toInteger(row.householdIncome15000To24999USD),
    i.householdIncome15000To24999USDPct = toFloat(row.householdIncome15000To24999USDPct),
    i.householdIncome25000To34999USD = toInteger(row.householdIncome25000To34999USD),
    i.householdIncome25000To34999USDPct = toFloat(row.householdIncome25000To34999USDPct),
    i.householdIncome35000To49999USD = toInteger(row.householdIncome35000To49999USD),
    i.householdIncome35000To49999USDPct = toFloat(row.householdIncome35000To49999USDPct),
    i.householdIncome50000To74999USD = toInteger(row.householdIncome50000To74999USD),
    i.householdIncome50000To74999USDPct = toFloat(row.householdIncome50000To74999USDPct),
    i.householdIncome75000To99999USD = toInteger(row.householdIncome75000To99999USD),
    i.householdIncome75000To99999USDPct = toFloat(row.householdIncome75000To99999USDPct),
    i.householdIncome100000To149999USD = toInteger(row.householdIncome100000To149999USD),
    i.householdIncome100000To149999USDPct = toFloat(row.householdIncome100000To149999USDPct),
    i.householdIncome150000To199999USD = toInteger(row.householdIncome150000To199999USD),
    i.householdIncome150000To199999USDPct = toFloat(row.householdIncome150000To199999USDPct),
    i.householdIncomeMoreThan200000USD = toInteger(row.householdIncomeMoreThan200000USD),
    i.householdIncomeMoreThan200000USDPct = toFloat(row.householdIncomeMoreThan200000USDPct),
    i.medianHouseholdIncomeUSD = toInteger(row.medianHouseholdIncomeUSD),
    i.meanHouseholdIncomeUSD = toInteger(row.meanHouseholdIncomeUSD),
    i.stateFips = row.stateFips, i.countyFips = row.countyFips,
    i.source = row.source, i.aggregationLevel = row.aggregationLevel
RETURN count(i) as Income
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP03IncomeAdmin2.csv' AS row
MATCH (e:Economics{id: 'ACSDP5Y2018.DP03-' + row.stateFips + '-' + row.countyFips})
MATCH (i:Income{id: 'ACSDP5Y2018.DP03-' + row.stateFips + '-' + row.countyFips})
MERGE (e)-[h:HAS_INCOME]->(i)
RETURN count(h) as HAS_INCOME
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP03IncomeZip.csv' AS row 
MERGE (i:Income{id: 'ACSDP5Y2018.DP03-' + row.postalCode})
SET i.name = 'Income-' + row.postalCode,
    i.totalHouseholds = toInteger(row.totalHouseholds),
    i.householdIncomeLessThan10000USD = toInteger(row.householdIncomeLessThan10000USD),
    i.householdIncomeLessThan10000USDPct = toFloat(row.householdIncomeLessThan10000USDPct),
    i.householdIncome10000To14999USD = toInteger(row.householdIncome10000To14999USD),
    i.householdIncome10000To14999USDPct = toFloat(row.householdIncome10000To14999USDPct),
    i.householdIncome15000To24999USD = toInteger(row.householdIncome15000To24999USD),
    i.householdIncome15000To24999USDPct = toFloat(row.householdIncome15000To24999USDPct),
    i.householdIncome25000To34999USD = toInteger(row.householdIncome25000To34999USD),
    i.householdIncome25000To34999USDPct = toFloat(row.householdIncome25000To34999USDPct),
    i.householdIncome35000To49999USD = toInteger(row.householdIncome35000To49999USD),
    i.householdIncome35000To49999USDPct = toFloat(row.householdIncome35000To49999USDPct),
    i.householdIncome50000To74999USD = toInteger(row.householdIncome50000To74999USD),
    i.householdIncome50000To74999USDPct = toFloat(row.householdIncome50000To74999USDPct),
    i.householdIncome75000To99999USD = toInteger(row.householdIncome75000To99999USD),
    i.householdIncome75000To99999USDPct = toFloat(row.householdIncome75000To99999USDPct),
    i.householdIncome100000To149999USD = toInteger(row.householdIncome100000To149999USD),
    i.householdIncome100000To149999USDPct = toFloat(row.householdIncome100000To149999USDPct),
    i.householdIncome150000To199999USD = toInteger(row.householdIncome150000To199999USD),
    i.householdIncome150000To199999USDPct = toFloat(row.householdIncome150000To199999USDPct),
    i.householdIncomeMoreThan200000USD = toInteger(row.householdIncomeMoreThan200000USD),
    i.householdIncomeMoreThan200000USDPct = toFloat(row.householdIncomeMoreThan200000USDPct),
    i.medianHouseholdIncomeUSD = toInteger(row.medianHouseholdIncomeUSD),
    i.meanHouseholdIncomeUSD = toInteger(row.meanHouseholdIncomeUSD),
    i.postalCode = row.postalCode,
    i.source = row.source, i.aggregationLevel = row.aggregationLevel
RETURN count(i) as Income
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP03IncomeZip.csv' AS row
MATCH (e:Economics{id: 'ACSDP5Y2018.DP03-' + row.postalCode})
MATCH (i:Income{id: 'ACSDP5Y2018.DP03-' + row.postalCode})
MERGE (e)-[h:HAS_INCOME]->(i)
RETURN count(h) as HAS_INCOME
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP03IncomeTract.csv' AS row 
MERGE (i:Income{id: 'ACSDP5Y2018.DP03-' + row.tract})
SET i.name = 'Income-' + row.tract,
    i.totalHouseholds = toInteger(row.totalHouseholds),
    i.householdIncomeLessThan10000USD = toInteger(row.householdIncomeLessThan10000USD),
    i.householdIncomeLessThan10000USDPct = toFloat(row.householdIncomeLessThan10000USDPct),
    i.householdIncome10000To14999USD = toInteger(row.householdIncome10000To14999USD),
    i.householdIncome10000To14999USDPct = toFloat(row.householdIncome10000To14999USDPct),
    i.householdIncome15000To24999USD = toInteger(row.householdIncome15000To24999USD),
    i.householdIncome15000To24999USDPct = toFloat(row.householdIncome15000To24999USDPct),
    i.householdIncome25000To34999USD = toInteger(row.householdIncome25000To34999USD),
    i.householdIncome25000To34999USDPct = toFloat(row.householdIncome25000To34999USDPct),
    i.householdIncome35000To49999USD = toInteger(row.householdIncome35000To49999USD),
    i.householdIncome35000To49999USDPct = toFloat(row.householdIncome35000To49999USDPct),
    i.householdIncome50000To74999USD = toInteger(row.householdIncome50000To74999USD),
    i.householdIncome50000To74999USDPct = toFloat(row.householdIncome50000To74999USDPct),
    i.householdIncome75000To99999USD = toInteger(row.householdIncome75000To99999USD),
    i.householdIncome75000To99999USDPct = toFloat(row.householdIncome75000To99999USDPct),
    i.householdIncome100000To149999USD = toInteger(row.householdIncome100000To149999USD),
    i.householdIncome100000To149999USDPct = toFloat(row.householdIncome100000To149999USDPct),
    i.householdIncome150000To199999USD = toInteger(row.householdIncome150000To199999USD),
    i.householdIncome150000To199999USDPct = toFloat(row.householdIncome150000To199999USDPct),
    i.householdIncomeMoreThan200000USD = toInteger(row.householdIncomeMoreThan200000USD),
    i.householdIncomeMoreThan200000USDPct = toFloat(row.householdIncomeMoreThan200000USDPct),
    i.medianHouseholdIncomeUSD = toInteger(row.medianHouseholdIncomeUSD),
    i.meanHouseholdIncomeUSD = toInteger(row.meanHouseholdIncomeUSD),
    i.tract = row.tract,
    i.source = row.source, i.aggregationLevel = row.aggregationLevel
RETURN count(i) as Income
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP03IncomeTract.csv' AS row
MATCH (e:Economics{id: 'ACSDP5Y2018.DP03-' + row.tract})
MATCH (i:Income{id: 'ACSDP5Y2018.DP03-' + row.tract})
MERGE (e)-[h:HAS_INCOME]->(i)
RETURN count(h) as HAS_INCOME
;