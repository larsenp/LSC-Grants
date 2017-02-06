
		
ALTER TABLE LSC_TIG_APP
   ADD conflicts_exist BIT NULL,
       address_conflicts VARCHAR(MAX),
       capacity_protect_conflicts VARCHAR(MAX),
       comply_conflicts_policy BIT NULL
