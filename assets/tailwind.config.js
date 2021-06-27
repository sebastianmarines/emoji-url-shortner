module.exports = {
  purge: [
    '../lib/**/*.ex',
    '../lib/**/*.leex',
    '../lib/**/*.eex',
    './js/**/*.js'
  ],
  theme: {
    container: {
      center: true,
    },
    fontFamily: {
      sans: ['Roboto', 'sans-serif']
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms'),
  ]
};