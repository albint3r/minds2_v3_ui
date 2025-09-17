# Minds2 Flutter App

## 📌 Descripción

Aplicación Flutter multiplataforma (Web / Desktop / Móvil) desarrollada con **Clean Architecture + BLoC + Dio**, basada en un **Design System agnóstico y reutilizable**.
El proyecto integra módulos clave de negocio: autenticación (JWT + Google OAuth), billing con Stripe, gestión de contactos y funnels, integraciones externas, notificaciones en tiempo real y campañas de WhatsApp Business.

---

## 🎨 Design System (DS)

El **Design System** define los fundamentos, componentes y layouts genéricos que todas las pantallas consumen.

* **Principios:**

    * Tokens primero (colores, tipografía, espacios, radios, sombras, duraciones).
    * Nombres semánticos (`primary`, `surface`, `error`, `success`...).
    * Accesibilidad (contraste, navegación teclado, focus visible).
    * Documentación viva (gallery) + golden tests.
* **Ámbito v1:** Foundations, Atoms, Molecules, Layouts (auth/dashboard).
* **Prefijo recomendado:** `DS` (ej. `DSButton`, `DSNavRail`, `DSDataTable`).
* **Checklist global:** uso de tokens, estados completos, responsive, props documentados, golden tests.

📂 Estructura propuesta:

```
lib/design_system/
  tokens/
  theme/
  components/atoms/
  components/molecules/
  components/organisms/
  gallery/
  utils/
```

---

## 🔑 Autenticación

* **Soporta:** Registro, login, confirmación de email, recuperación/cambio contraseña, Google OAuth.
* **Endpoints:** `/v3/auth/*`.
* **Notas técnicas:**

    * Tokens JWT (access + refresh).
    * Dio con interceptores.
    * Manejo de deep links para reset/confirmación.
* **Pantallas:** Login, Sign Up, Forgot, Reset, Email Confirm.

---

## 💳 Billing

* **Pantallas de usuario:** Pricing Plans, Current Plan, Invoices.
* **Admin seguro:** CRUD de planes/features protegido por roles.
* **Integración:** Stripe Checkout.
* **Exportación:** CSV/PDF de facturas.
* **Seguridad:** RBAC (roles admin/super\_admin).

---

## 🏠 Home (Dashboard)

* **Empty State:** sin proyectos → CTAs “Crear plan / Unirme a un proyecto”.
* **Active State:** KPIs (Contactos, Citas, Deals, Mensajes) + gráfica filtrable.
* **Filtros:** proyecto, fechas, granularidad.
* **Notas:** cálculos de variación, memoización, estados loading/error/empty/ok.

---

## 👥 Contacts

* **Vistas:** tabla + grid.
* **Funciones:** filtros avanzados, bulk ops (delete, merge, assign-random), import/export CSV, tags, deals, enrolamiento masivo en campañas.
* **RBAC:** permisos por grants de proyecto.
* **Endpoints clave:** `/v3/contacts/projects/{project_id}/*`.

---

## 📊 Funnels

* **Vistas:** Kanban + tabla con filtros.
* **Configurador:** crear/editar funnels y stages, drag & drop, bulk move/delete.
* **RBAC:** grants por proyecto.
* **Endpoints:** `/v3/funnels/{project_id}/*`.

---

## 🔌 Integraciones

* **Secciones:** Market (catálogo) + Mis Integraciones.
* **Funciones:** instalar, configurar, copiar Webhook URL, habilitar/deshabilitar.
* **Configuración dinámica:** formularios generados desde `config_schema`.
* **RBAC:** dueños/admin gestionan; otros solo ven.

---

## 🔔 Notificaciones

* **Superficies:**

    * Dropdown en navbar (badge 0 oculto, 1–9 exacto, ≥10 → “+9”).
    * Centro de notificaciones (página completa, filtros, mark all).
* **Tiempo real:** WebSocket (`wss://api.minds2.com/v3/notifications/ws?token=<jwt>`).
* **Fallback:** polling HTTP.
* **Acciones:** marcar como leído/no leído, marcar todas, (opcional) eliminar.

---

## 💬 WhatsApp Campaigns

* **Módulos:** Campañas, Templates, Canvas.
* **Reglas:** máx. 5 templates por campaña; placeholders {{n}} deben mapearse a propiedades reales.
* **Canvas:** drag & drop de contactos entre etapas, criterios de envío, previews embebidos.
* **Gestión de templates:** crear/editar/preview con datos de ejemplo, estado WA (`pending/approved/rejected`).
* **Endpoints:** `/v3/campaigns/*` (con propuestos para enrolar/mover/criterios).
* **RBAC:** owners/admin CRUD total, otros solo operación limitada.

---

## 🛠️ Stack Técnico

* **Framework:** Flutter (web, desktop, móvil).
* **Arquitectura:** Clean Architecture + BLoC/Cubit.
* **Networking:** Dio con interceptores (Auth + Refresh).
* **Storage:** localStorage (tokens, preferencias UI).
* **Testing:** unit, integration, golden tests, E2E.
* **Accesibilidad:** contraste, focus visible, navegación por teclado.

---

## ✅ Backlog (alto nivel)

1. **Fase A:** Foundations & Theme.
2. **Fase B:** Atoms (Button, Input, Checkbox, etc.).
3. **Fase C:** Molecules (NavRail, Card, DataTable, etc.).
4. **Fase D:** Layouts & Gallery.
5. **Producto:** Auth, Billing, Home, Contacts, Funnels, Integrations, Notifications, Campaigns.

---

## 📎 Recursos

* 🎨 [Figma – Minds2](https://www.figma.com/design/ea6O9Svu7ts9P4lUlYC588/Minds2?node-id=0-1&p=f&t=AapHQwv0Xn54VQW6-0)
* 📚 Documentación de APIs: `/v3/*`