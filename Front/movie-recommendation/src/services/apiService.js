/**
 * @param { URL } url
 * @param { string } bodyApi
 * @param { string } methodApi
 * @returns { json }
 */
export async function fetchData (url, bodyApi, methodApi) {
    const data = await fetch(url, {
        method: methodApi,
        body: bodyApi,
        headers: {
            'Content-Type': 'application/json'
        }
    })

    return data.json()
}
