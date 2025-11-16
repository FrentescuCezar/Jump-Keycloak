# Jump-Keycloak

Pre-configured Keycloak image that auto-imports the **jump** realm.

Local dev

```bash
cp .env.example .env
npm run docker            # opens http://localhost:8080
```

## Custom Jump theme

- Login and email overrides live in `themes/jump`. Update FTL, CSS, JS, or `messages/*.properties` to change copy, layout, or branding.
- Dev compose mounts `themes/jump` directly into the container and turns off theme caching, so edits take effect after a browser refresh.
- Rebuild the prod image (`npm run docker:prod`) after editing themes so the optimized server includes the new assets.

### Testing email templates

The dev environment includes **MailHog** to capture emails locally:

1. Start the stack: `npm run docker`
2. Open **MailHog UI**: http://localhost:8025 (all emails sent by Keycloak will appear here)
3. In Keycloak Admin Console (http://localhost:8080):
   - Go to **Users** → select a user → **Send email** → **Verify email**
   - Or trigger registration flow to see the verification email
4. View the email in MailHog's web interface - you can see both HTML and plain text versions

**Alternative**: Configure Keycloak to use your own SMTP server by updating the `KC_SMTP_*` environment variables in `docker/compose.dev.yml`.
