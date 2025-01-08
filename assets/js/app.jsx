import React from "react";
import axios from "axios";

import { createInertiaApp } from "@inertiajs/react";
import { hydrateRoot } from "react-dom/client";

axios.defaults.xsrfHeaderName = "x-csrf-token";

createInertiaApp({
  resolve: async (name) => {
    return await import(`./pages/${name}.jsx`);
  },
  setup({ App, el, props }) {
    hydrateRoot(el).render(<App {...props} />);
  },
});
