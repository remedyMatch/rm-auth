<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg(properties.loginTitle)}</title>
    <link rel="icon" type="image/png" href="${url.resourcesPath}/img/favicon.png">

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}?v=2.2.0" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<#if url.oauthAction?contains("first-broker-login")>
<#assign mapping = true>
<#else>
<#assign mapping = false>
</#if>
<#if realm.password && social.providers?? && ! url.oauthAction?contains("first-broker-login") && client?? && client.clientId?contains("osc.edu")>
<#assign showSocial = true>
<#else>
<#assign showSocial = false>
</#if>

<body class="${properties.kcBodyClass!}">
  <div class="${properties.kcLoginClass!}">
  <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">

     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarNavDropdown">
       <ul class="navbar-nav ml-auto">

         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             ${locale.current}
           </a>
           <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <#list locale.supported as l>
                  <a class="dropdown-item" href="${l.url}">${l.label}</a>
              </#list>
           </div>
         </li>
       </ul>
     </div>
   </nav>
   </#if>
  <div class="row">
    <div id="kc-header" <#if showSocial >class="${properties.kcSocialHeaderClass!}"<#else>class="${properties.kcHeaderClass}"</#if>>
      <p><img src="${url.resourcesPath}/img/logo.png"></p>
      <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
    </div>
    </div>
   </div>

          <#if displayMessage && message?has_content>
              <div class="alert alert-${message.type} col-md-6 heading-section ftco-animate text-center fadeInUp ftco-animated offset-md-3">
                  <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  <span class="kc-feedback-text">${message.summary?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
  </div>
</body>
</html>
</#macro>
