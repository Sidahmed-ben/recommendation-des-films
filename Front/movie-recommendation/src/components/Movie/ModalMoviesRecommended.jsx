import PropTypes from 'prop-types'
import React, { useEffect, useState } from 'react'
import { Box, Modal, Typography } from '@mui/material'
import MovieCard from './MovieCard'

const style = {
    position: 'absolute',
    top: '50%',
    left: '55%',
    transform: 'translate(-50%, -50%)',
    width: '80%',
    height: '70%',
    bgcolor: 'background.paper',
    boxShadow: 24,
    p: 4,
    overflowY: 'auto'
}

const containerStyle = {
    width: '100%',
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'center'
}

function ModalMoviesRecommended ({ isOpen, moviesRecommended }) {
    const [open, setOpen] = useState(false)
    const openModal = () => setOpen(true)
    const closeModal = () => setOpen(false)

    useEffect(() => {
        openModal()
    }, [isOpen])

    return (
        <div>
            <Modal
                open={open}
                onClose={closeModal}
                aria-labelledby="modal-modal-title"
                aria-describedby="modal-modal-description"
            >
                <Box sx={style}>
                    <Typography id="modal-modal-title" variant="h4" component="h2" sx={{ textAlign: 'center', marginBottom: 3 }}>
                        Les films recommandés
                    </Typography>
                    <Box sx={containerStyle}>
                        {moviesRecommended.map((movie, index) => (
                            <Box key={index} sx={{ containerStyle }}>
                                <MovieCard movie={movie} />
                            </Box>
                        ))}
                    </Box>
                </Box>
            </Modal>
        </div>
    )
}

ModalMoviesRecommended.propTypes = {
    isOpen: PropTypes.bool.isRequired,
    moviesRecommended: PropTypes.array.isRequired
}

export default ModalMoviesRecommended
