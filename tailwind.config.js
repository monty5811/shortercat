const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  theme: {
    extend: {
      width: {
        "vw-95": "95vw"
      },
      height: {
        "vh-75": "75vh"
      },
      maxHeight: {
        "vh-75": "75vh"
      },
      spacing: {
        "1px": "1px",
        128: "32rem"
      },
      fontFamily: {
        sans: ["Montserrat", ...defaultTheme.fontFamily.sans]
      }
    },
    customForms: theme => ({
      default: {
        input: {
          "&:focus": {
            boxShadow: undefined,
            borderColor: undefined
          }
        }
      }
    })
  },
  variants: {},
  plugins: [require("@tailwindcss/custom-forms")]
};
