import env from 'react-dotenv'

/**
 * @param {string} url
 * @returns {URL}
 */
export function getUrl (url) {
    return new URL(url, env.URL_API)
}

/**
 * @param {string} url
 * @param {string|int} id
 * @returns {URL}
 */
export function getUrlById (url, id) {
    return new URL(url + id, env.URL_API)
}
