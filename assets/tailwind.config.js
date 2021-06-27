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
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms'),
  ]
};