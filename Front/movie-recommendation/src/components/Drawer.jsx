import * as React from 'react'
import PropTypes from 'prop-types'
import AppBar from '@mui/material/AppBar'
import Box from '@mui/material/Box'
import CssBaseline from '@mui/material/CssBaseline'
import Divider from '@mui/material/Divider'
import Drawer from '@mui/material/Drawer'
import List from '@mui/material/List'
import ListItem from '@mui/material/ListItem'
import ListItemButton from '@mui/material/ListItemButton'
import ListItemIcon from '@mui/material/ListItemIcon'
import ListItemText from '@mui/material/ListItemText'
import Typography from '@mui/material/Typography'
import MovieFilterIcon from '@mui/icons-material/MovieFilter'
import LeaderboardIcon from '@mui/icons-material/Leaderboard'

const drawerWidth = 240

function ResponsiveDrawer (props) {
    const { window } = props
    const [mobileOpen, setMobileOpen] = React.useState(false)

    const handleDrawerToggle = () => {
        setMobileOpen(!mobileOpen)
    }

    const drawer = (
        <div>
            <List>
                <Typography textAlign={'center'} variant='h5'>
                    Recommandation Movies IA
                </Typography>
                <Box
                    component="img"
                    sx={{
                        height: 233,
                        width: 350,
                        maxHeight: { xs: 233, md: 167 },
                        maxWidth: { xs: 350, md: 250 }
                    }}
                    alt="Recommandation des films"
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ5QrZ-DGTTpkg-Hg1DMcZNQ79VJJ3A1lyDg&usqp=CAU"
                />
                <Divider />
            </List>
            <List>
                {['Genres Films', 'Les plus votés'].map((text, index) => (
                    <ListItem key={text} disablePadding>
                        <ListItemButton>
                            <ListItemIcon>
                                {index % 2 === 0 ? <MovieFilterIcon /> : <LeaderboardIcon/>}
                            </ListItemIcon>
                            <ListItemText primary={text} />
                        </ListItemButton>
                    </ListItem>
                ))}
            </List>
            <Divider />
        </div>
    )

    const container = window !== undefined ? () => window().document.body : undefined

    return (
        <Box sx={{ display: 'flex' }}>
            <CssBaseline />
            <AppBar
                position="fixed"
                sx={{
                    width: { sm: `calc(100% - ${drawerWidth}px)` },
                    ml: { sm: `${drawerWidth}px` }
                }}
            >
            </AppBar>
            <Box
                component="nav"
                sx={{ width: { sm: drawerWidth }, flexShrink: { sm: 0 } }}
                aria-label="mailbox folders"
            >
                <Drawer
                    container={container}
                    variant="temporary"
                    open={mobileOpen}
                    onClose={handleDrawerToggle}
                    ModalProps={{
                        keepMounted: true
                    }}
                    sx={{
                        display: { xs: 'block', sm: 'none' },
                        '& .MuiDrawer-paper': { boxSizing: 'border-box', width: drawerWidth }
                    }}
                >
                    {drawer}
                </Drawer>
                <Drawer
                    variant="permanent"
                    sx={{
                        display: { xs: 'none', sm: 'block' },
                        '& .MuiDrawer-paper': { boxSizing: 'border-box', width: drawerWidth }
                    }}
                    open
                >
                    {drawer}
                </Drawer>
            </Box>
        </Box>
    )
}

ResponsiveDrawer.propTypes = {
    window: PropTypes.func
}

export default ResponsiveDrawer
