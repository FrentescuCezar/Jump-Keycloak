<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}"<#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
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
    <#if authenticationSession??>
        <script type="module">
            import { checkCookiesAndSetTimer } from "${url.resourcesPath}/js/authChecker.js";

            checkCookiesAndSetTimer(
              "${authenticationSession.authSessionId}",
              "${authenticationSession.tabId}",
              "${url.ssoLoginInOtherTabsUrl}"
            );
        </script>
    </#if>
</head>

<body class="${properties.kcBodyClass!} ${bodyClass}">
<div class="jump-login-grid">
    <section class="jump-hero" aria-label="Jump welcome">
        <div class="jump-logo">
            <img src="${url.resourcesPath}/img/logo.svg" alt="Jump" />
            <span>${realm.displayName!realm.name}</span>
        </div>
        <div>
            <p class="jump-hero-eyebrow">${msg("jumpLoginHero")}</p>
            <h1>${kcSanitize(msg("jumpLoginTitle", realm.displayName!realm.name))?no_esc}</h1>
            <p>${msg("jumpLoginSubtitle")}</p>
        </div>
        <div class="jump-hero-footer">
            <div>
                <p>${msg("jumpLoginSupport")}</p>
            </div>
        </div>
    </section>

    <section class="jump-panel" aria-live="polite">
        <header class="jump-panel-head">
            <div>
                <p class="jump-badge">${msg("loginTitle", realm.displayName!realm.name)}</p>
                <h2><#nested "header"></h2>
            </div>
            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <label class="jump-language">
                    <span class="sr-only">${msg("languages")}</span>
                    <select aria-label="${msg("languages")}" onchange="if (this.value) window.location.href=this.value">
                        <#list locale.supported?sort_by("label") as l>
                            <option value="${l.url}" ${(l.languageTag == locale.currentLanguageTag)?then('selected','')}>
                                ${l.label}
                            </option>
                        </#list>
                    </select>
                </label>
            </#if>
        </header>

        <div class="jump-panel-body">
            <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                <#if displayRequiredFields>
                    <div class="jump-required">${msg("requiredFields")}</div>
                </#if>
            <#else>
                <div class="jump-username-chip">
                    <#nested "show-username">
                    <span>${auth.attemptedUsername}</span>
                    <a class="jump-reset" href="${url.loginRestartFlowUrl}" aria-label="${msg('restartLoginTooltip')}">
                        ${msg('restartLoginTooltip')}
                    </a>
                </div>
            </#if>

            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="jump-alert jump-${(message.type == 'error')?then('danger', message.type)}">
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <div class="jump-form-wrapper">
                <#nested "form">
            </div>

            <#if auth?has_content && auth.showTryAnotherWayLink()>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" class="jump-alt-action">
                    <input type="hidden" name="tryAnotherWay" value="on"/>
                    <button type="submit">${msg("doTryAnotherWay")}</button>
                </form>
            </#if>

            <#if displayInfo>
                <div class="jump-register">
                    <#nested "info">
                </div>
            </#if>

            <p class="jump-legal">${msg("jumpLegal")}</p>
        </div>

        <footer class="jump-panel-footer">
            <p>${msg("jumpLoginSsoTitle")}</p>
            <div class="jump-social">
                <#nested "socialProviders">
            </div>
        </footer>
    </section>
</div>
</body>
</html>
</#macro>
