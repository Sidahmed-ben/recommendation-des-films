import Cookies from 'js-cookie'
import { getUrl } from './urlGeneratorService'
import { fetchData } from './apiService'

/**
 * @param {*} navigate
 */
export function redirectToLogin (navigate) {
    if (!isLogged()) {
        navigate('/login', { replace: true })
    }
}

export function redirectToLoginIfIsConnected (navigate) {
    if (isLogged()) {
        navigate('/login', { replace: true })
    }
}

/**
 * @returns {boolean}
 */
export const isLogged = () => {
    return Cookies.get('idToken') !== undefined
}

export const logout = async () => {
    const body = JSON.stringify({ idToken: Cookies.get('idToken') })
    const url = getUrl('/logout')
    const data = fetchData(url, body, 'POST')

    return data
}
