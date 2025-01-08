import React from "react";
import ReactDOMServer from "react-dom/server";
import { createInertiaApp } from "@inertiajs/react";

export function render(page) {
  return createInertiaApp({
    page,
    render: ReactDOMServer.renderToString,
    resolve: async (name) => {
      return await import(`./pages/${name}.jsx`);
    },
    setup: ({ App, props }) => <App {...props} />,
  });
}
