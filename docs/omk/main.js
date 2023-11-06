async function getData() {
    try {
        const response = await fetch("http://127.0.0.1:8000/omeka/api/items")
        if (!response.ok) {
            throw new Error("La réponse n'a pas pu être retourné")
        }

        return response.json()
    } catch (error) {
        console.error("Un problème serveur est survenu :", error)
        return null
    }
}

document.addEventListener("DOMContentLoaded", function () {
    setData()
})

async function setData() {
    const items = await getData()

    if (items) {
        removeLoader()
        createHtmlContentCards(items)
    }
}

function getUsers(items) {
    const usersList = []
    const movies_recommended = []
    const movies = []
    const movies_rating = []

    items.forEach((obj) => {
        if (obj["@type"].includes("mr:User")) {
            const user = {
                username: obj["mr:username"][0]["@value"],
                email: obj["mr:email"][0]["@value"],
                id: obj["o:id"],
            }
            usersList.push(user)
        } else if (obj["@type"].includes("mr:MovieRecommanded")) {
            const movie_recommended = {
                movie_id: obj["mr:hasMovie"][0]["value_resource_id"],
                user_id: obj["mr:hasUser"][0]["value_resource_id"],
            }
            movies_recommended.push(movie_recommended)
        } else if (obj["@type"].includes("mr:Movie")) {
            const movie = {
                title: obj["dcterms:title"][0]["@value"],
                id: obj["o:id"],
            }
            movies.push(movie)
        } else if (obj["@type"].includes("mr:MovieRating")) {
            const movie_rating = {
                movie_id: obj["mr:hasMovie"][0]["value_resource_id"],
                user_id: obj["mr:hasUser"][0]["value_resource_id"],
                rating: obj["mr:rating"][0]["@value"],
            }
            movies_rating.push(movie_rating)
        }
    })

    return { usersList, movies_recommended, movies, movies_rating }
}

function createFinalStructure(
    usersList,
    movies,
    movies_recommended,
    movies_rating
) {
    const finalStructure = []
    usersList.forEach((user) => {
        const userElement = {
            user: {
                username: user.username,
                email: user.email,
                movies_recommended: [],
                movies_rating: [],
            },
        }
        movies_recommended.forEach((movie_rec) => {
            if (user.id == movie_rec.user_id) {
                movie_name = movies.find(
                    (obj) => obj.id == movie_rec.movie_id
                ).title
                userElement.user.movies_recommended.push(movie_name)
            }
        })
        movies_rating.forEach((movie_rat) => {
            if (user.id == movie_rat.user_id) {
                const ratedElement = {
                    title: movies.find((obj) => obj.id == movie_rat.movie_id)
                        .title,
                    rating: movie_rat.rating,
                }
                userElement.user.movies_rating.push(ratedElement)
            }
        })

        finalStructure.push(userElement)
    })

    return finalStructure
}

async function createHtmlContentCards(items) {
    const container = d3.select(".container")
    const row = container.append("div").attr("class", "row")

    const moviesItems = getItemsFiltered(items, "mr:Movie")
    const colMovies = setCol(row)
    const colUsers = setCol(row)


    const { usersList, movies_recommended, movies, movies_rating } = getUsers(items)
    const usersData = createFinalStructure(
        usersList,
        movies,
        movies_recommended,
        movies_rating
    )

    const moviesCards = getCards(colMovies, moviesItems)
    const usersCards = getCards(colUsers, usersData)

    console.log(moviesItems)

    moviesCards
        .append("div")
        .attr("class", "card")
        .each(function () {
            setMovieCard(this)
        })
    usersCards
        .append("div")
        .attr("class", "card")
        .each(function () {
            setUsersInformations(this)
        })
}

function setMovieCard(that) {
    d3.select(that)
        .append("div")
        .attr("class", "card-body")
        .append("h5")
        .attr("class", "card-title")
        .text((item) => item["dcterms:title"][0]["@value"])
}

function setUsersInformations(that) {
    d3.select(that)
        .append("div")
        .attr("class", "card-body")
        .append("h5")
        .attr("class", "card-title")
        .text((data) => `Les informations de ${data.user.username}`)

    d3.select(that)
        .select(".card-body")
        .append("p")
        .attr("class", "card-text")
        .text((data) => `email: ${data.user.email}`)

    d3.select(that)
        .select(".card-body")
        .append("p")
        .text("Les films votés")
        .selectAll("p")
        .data((data) => data.user.movies_rating)
        .enter()
        .append("p")
        .attr("style", "padding-left:30px")
        .text((movie) => `Titre : ${movie.title}\nNote : ${movie.rating}`)

    d3.select(that)
        .select(".card-body")
        .append("p")
        .attr("style", "margin-bottom:10px")
        .text("Les films recommandées")
        .selectAll("p")
        .data((data) => data.user.movies_recommended)
        .enter()
        .append("p")
        .attr("style", "padding-left:30px")
        .text((movie) => `Titre : ${movie}`)
}

function setCol(row) {
    return row.append("div").attr("class", "col-sm-6")
}
function getCards(col, items) {
    return col
        .selectAll(".col-sm-6")
        .data(items)
        .enter()
        .append("div")
        .attr("class", "mb-3 mb-sm-0 shadow p-3 mb-5 bg-body-tertiary rounded")
}

function getItemsFiltered(items, type) {
    return items.filter((item) => item["@type"][1] === type)
}

function removeLoader() {
    d3.select(".spinner-grow").style("display", "none")
}
