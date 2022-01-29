
resource "azurerm_container_registry" "main"  {
	name					=  var.main_name
	resource_group_name     =  data.azurerm_resource_group.main.name
	location	      	    =  var.custom_location
	sku		        		=  var.sku
	admin_enabled           =  var.admin_enabled
	
	georeplications {
		location		=  var.geo_location
		zone_redundancy_enabled	=  var.enable_zone_redundancy
	}
	
	identity {
		type		    =  var.identity_type
		# identity_ids	=  var.user_assigned_identities
	}
	
	tags				=  var.extra_tags
	lifecycle {
    		prevent_destroy = false
  	}
	 
}