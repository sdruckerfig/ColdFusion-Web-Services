<cfcomponent>
  <cfset this.name = "walk9_3">
  <cfset this.datasource="cfjqm">
  
  
   <cfset this.restsettings.skipcfcwitherror = false>
  
  
  <cffunction name="onApplicationStart">
   <cfset application.googlemapskey = "ABQIAAAAPnOo-9KzoTHfxfMaLnmE0RT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQ4KioDxCaWrydeiCt01VSXfb1EBg">
   <cfset application.datasource = this.datasource>
   <cfset restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()), this.name)>
  </cffunction>
  
  <cffunction name="onRequestStart">
    
    <cfif isdefined("url.init")>
      <cfset onApplicationStart()> 
    </cfif>
  
  </cffunction>

</cfcomponent>