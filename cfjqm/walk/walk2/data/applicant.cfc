
<cfcomponent restpath="applicant" rest="true" extends="base">
	
  <!--- step 4 --->
  
                
		<cfquery name="local.q">
          select *
          from applicant
        </cfquery>
     
		<cfreturn query2array(local.q)>
	</cffunction>
    
  
  <!--- step 5 --->
                
		<cfquery name="local.q">
          select *
          from applicant
          where applicantid = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.applicantid#">
        </cfquery>
     
     	<cfset local.result = query2array(local.q)>
    
		<cfreturn local.result[1]>
	</cffunction>
  
  <!--- step 8 --->
    
  
                
		<cfquery name="local.q">
          delete
          from applicant
          where applicantid = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.applicantid#">
        </cfquery>
    
		<cfreturn {applicantId = arguments.applicantId}>
	</cffunction>
    
     
 
 <!--- step 12 --->
        
    <cftransaction>        
		<cfquery>
         insert into applicant (firstname,lastname,email,hsgrad,hsgpa,major)
         values (
         	<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.firstname#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lastname#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">,
            <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.hsgrad#">,
            <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.hsgpa#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.major#">
         )
         </cfquery>
    
    	 <cfquery name="local.getlast">
         	select LAST_INSERT_ID() as lastid
            from applicant
    	 </cfquery>
         </cftransaction>
         
		<cfreturn local.getlast.lastid>
	</cffunction>
    
   
   <!--- step 15 --->
        
     
		 <cfquery>
           update applicant 
           set firstname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.firstname#">,
               lastname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lastname#">,
               email =  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">,
               hsgrad = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.hsgrad#">,
               hsgpa = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.hsgpa#">,
               major = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.major#">
           where applicantId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.applicantId#">
         </cfquery>
    
 		<cfreturn {applicantid = arguments.applicantid}>
	</cffunction>
    
</cfcomponent>