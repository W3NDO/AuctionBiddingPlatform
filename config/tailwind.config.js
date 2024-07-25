const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
    colors: {
      'white': '#ffffff',
      'primary-blue': '#007BFF',
      'dark-blue': '#0056b3',
      'light-blue': '#d1e7ff',
      'accent-blue': '#00aaff',
      'muted-blue': '#6c757d',
      'border-blue': '#80bdff',
      'background-blue': '#e9f7fd',
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
