ALTER TABLE LSC_c_STATE_PROV
    ADD mldcp_eligible BIT NOT NULL DEFAULT 0

GO

UPDATE LSC_c_STATE_PROV
    SET mldcp_eligible = 1
    FROM LSC_c_STATE_PROV lsp
        JOIN c_STATE_PROV sp ON lsp.state_province_id = sp.id
    WHERE sp.description IN ('Arkansas', 'Iowa', 'Kansas', 'Minnesota', 'Missouri', 'Montana', 'Nebraska', 'North Dakota', 'Oklahoma', 'South Dakota') 