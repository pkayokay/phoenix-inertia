import { createElement } from "react";
import axios from "axios";

import { createInertiaApp } from "@inertiajs/react";
import { createRoot, hydrateRoot } from "react-dom/client";

axios.defaults.xsrfHeaderName = "x-csrf-token";

createInertiaApp({
  resolve: async (name) => {
    return await import(`./pages/${name}.jsx`);
  },
  setup({ el, App, props }) {
    if (process.env.NODE_ENV === "production") {
      hydrateRoot(el, createElement(App, props));
    } else {
      const root = createRoot(el);
      root.render(createElement(App, props));
    }
  },
});
