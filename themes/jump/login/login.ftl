<#import "template.ftl" as layout>
<#assign registrationAvailable = realm.password && realm.registrationAllowed && !registrationDisabled??>
<#assign showSocial = social.providers??>

<@layout.registrationLayout bodyClass="jump-body" displayInfo=registrationAvailable displayMessage=true; section>
    <#if section = "header">
        ${msg("jumpLoginTitle", realm.displayName!realm.name)}
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="jump-form" action="${url.loginAction}" method="post" onsubmit="login.disabled = true; return true;">
                <#if !usernameHidden??>
                    <label for="username">
                        <span>${msg("username")}</span>
                        <#if realm.loginWithEmailAllowed>
                            <small>${msg("usernameOrEmail")}</small>
                        </#if>
                    </label>
                    <input tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                    <#if messagesPerField.existsError('username','password')>
                        <div class="jump-field-error">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                    </#if>
                </#if>

                <label for="password">
                    <span>${msg("jumpPasswordLabel")}</span>
                    <small>${msg("jumpPasswordHint")}</small>
                </label>
                <input tabindex="2" id="password" name="password" type="password" autocomplete="off"
                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                    <div class="jump-field-error">
                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                    </div>
                </#if>

                <div class="jump-form-meta">
                    <#if realm.rememberMe && !usernameHidden??>
                        <label class="jump-remember" data-remember-copy="${msg('rememberMe')}">
                            <#if login.rememberMe??>
                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked />
                            <#else>
                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" />
                            </#if>
                            <span>${msg("jumpRememberMe")}</span>
                        </label>
                    </#if>

                    <#if realm.resetPasswordAllowed>
                        <a class="jump-link" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                    </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />
                <input tabindex="4" class="jump-submit" type="submit" name="login" value="${msg("doLogIn")}" />
            </form>
        </#if>
    <#elseif section = "info">
        <div>
            <span>${msg("jumpRegisterLead")}</span>
            <#if registrationAvailable>
                <a href="${url.registrationUrl}">${msg("jumpRegisterCta")}</a>
            </#if>
        </div>
    <#elseif section = "socialProviders">
        <#if showSocial>
            <div class="jump-social-list">
                <#list social.providers as p>
                    <a id="social-${p.alias}" href="${p.loginUrl}" aria-label="${p.displayName}">
                        <#if p.iconClasses?has_content>
                            <i class="${p.iconClasses}"></i>
                        </#if>
                        <span>${p.displayName!}</span>
                    </a>
                </#list>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
