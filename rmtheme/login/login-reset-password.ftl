<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
     <div id="kc-form"  class="${properties.kcFormClass!}" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
     <div class="form-rect">
               <p>&nbsp;</p>
               <div class="${properties.loginHeadingClass!}">
                               <h2 class="mb-4">${msg("doForgotPassword")}</h2></div>
        <form id="kc-reset-password-form" class="form reset-password" action="${url.loginAction}" method="post">
            <div class="reset-password-field ${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" name="username" class="form-control ${properties.kcInputClass!}" autofocus/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClassForgotPW!} col-8 offset-md-2 row">

                    <div class="${properties.kcFormButtonsClass!}">
                        <span>
                            <a class="btn btn-block btn-primary" href="${url.loginUrl}" style="margin-bottom:1rem;">${msg("backToLogin")}</a>
                        </span>


                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ">
                    <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>
            </br>
        </form>
       </div>
       </div>
    <#elseif section = "info" >

        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
