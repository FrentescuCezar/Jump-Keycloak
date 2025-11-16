<#macro emailLayout>
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!"en"}">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>${msg("emailVerificationSubject")}</title>
</head>
<body style="margin:0;padding:32px;background-color:#0f172a;font-family:'Inter','Segoe UI',Arial,sans-serif;">
  <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td align="center">
        <table role="presentation" cellpadding="0" cellspacing="0" width="600" style="max-width:600px;background:#ffffff;border-radius:16px;overflow:hidden;box-shadow:0 20px 45px rgba(15,23,42,0.35);">
          <tr>
            <td style="padding:32px 40px;background:linear-gradient(135deg,#7c3aed,#5b21b6);color:#fff;">
              <table role="presentation" width="100%">
                <tr>
                  <td style="font-size:0;line-height:0;">
                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHZpZXdCb3g9JzAgMCA0OCA0OCc+PHJlY3Qgd2lkdGg9JzQ4JyBoZWlnaHQ9JzQ4JyByeD0nMTInIGZpbGw9JyM3QzNBRUQnLz48cGF0aCBkPSdNMTQgMzBjMy41LTcgNy0xMCAxMi0xMCA1IDAgOCAzIDggOCAwIDUtMyA4LTggOGgtMmwxLjUtNS41aC41YzIgMCAzLTEgMy0zcy0xLTMtMy0zYy00IDAtNi41IDMtOC41IDguNUwxNCAzMFonIGZpbGw9JyNmZmYnLz48L3N2Zz4=" alt="Jump" width="64" height="64" style="display:block;border:0;" />
                  </td>
                  <td align="right" style="text-align:right;font-size:14px;letter-spacing:0.2em;text-transform:uppercase;opacity:0.8;">${realm.displayName!realm.name}</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td style="padding:40px 40px 32px;color:#0f172a;">
              <#nested>
            </td>
          </tr>
          <tr>
            <td style="padding:24px 40px 40px;border-top:1px solid #e2e8f0;color:#64748b;font-size:13px;line-height:1.6;">
              <p style="margin:0 0 4px;">${msg("jumpEmailFooter")}</p>
              <p style="margin:0;">${msg("jumpEmailFooterWarning")}</p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
</#macro>
