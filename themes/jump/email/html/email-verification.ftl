<#import "template.ftl" as layout>
<@layout.emailLayout>
  <p style="margin:0 0 12px;font-size:12px;letter-spacing:0.2em;text-transform:uppercase;color:#a78bfa;">${msg("emailVerificationSubject")}</p>
  <h1 style="margin:0 0 16px;font-size:28px;line-height:1.4;">${msg("jumpEmailVerifyTitle", realm.displayName!realm.name)}</h1>
  <p style="margin:0 0 16px;font-size:15px;line-height:1.7;color:#475569;">
    ${msg("jumpEmailVerifySubtitle")}
  </p>
  <p style="margin:0 0 24px;font-size:14px;color:#7c3aed;font-weight:600;">
    ${msg("jumpEmailVerifyHighlight", linkExpirationFormatter(linkExpiration))}
  </p>
  <table role="presentation" cellpadding="0" cellspacing="0" style="margin:0 0 28px;">
    <tr>
      <td align="center" style="border-radius:999px;" bgcolor="#7c3aed">
        <a href="${link}"
          style="display:inline-block;padding:14px 36px;font-size:16px;font-weight:600;color:#ffffff;text-decoration:none;font-family:'Inter','Segoe UI',Arial,sans-serif;">
          ${msg("jumpEmailVerifyButton")}
        </a>
      </td>
    </tr>
  </table>
  <p style="margin:0 0 4px;font-size:13px;color:#94a3b8;">${msg("jumpEmailVerifyFallback")}</p>
  <p style="margin:0 0 24px;font-size:13px;font-family:'Roboto Mono','Courier New',monospace;background:#f9fafb;border:1px solid #e2e8f0;padding:12px;border-radius:10px;word-break:break-all;">
    ${link}
  </p>
  <p style="margin:0 0 12px;font-size:14px;color:#475569;">${msg("jumpEmailSupport")}</p>
</@layout.emailLayout>
