install.packages('leaflet.extras')
# Load the libraries
library(leaflet)
library(leaflet.extras)
library(dplyr)

# Load the data
data.location = read.csv('/path-to-file/Location Data.txt',
                         header = TRUE,
                         sep = ',')
# Create leaflet
leaflet(data.location) %>%
  addProviderTiles(providers$OpenStreetMap) %>%
  addMarkers(lng = ~long,
             lat = ~lat,
             popup = paste(paste('<b>Office:</b>',
                                 data.location$place),
                           paste('<b>Address:</b>',
                                 data.location$address),
                           paste('<b>Lat:</b>',
                                 data.location$lat),
                           paste('<b>Long:</b>',
                                 data.location$long),
                           paste('<b>Supervisor:</b>',
                                 data.location$supervisor),
                           data.location$student1,
                           data.location$student2,
                           data.location$student3,
                           sep = '<br/>'),
             label = ~place,
             group = 'data.location') %>%
  addResetMapButton() %>%
  addSearchFeatures(
    targetGroups = 'data.location',
    options = searchFeaturesOptions(zoom = 15,
                                    openPopup = TRUE,
                                    firstTipSubmit = TRUE,
                                    autoCollapse = TRUE,
                                    hideMarkerOnCollapse = TRUE))%>%
  addMeasure(
    position = 'bottomleft',
    primaryLengthUnit = 'meters',
    primaryAreaUnit = 'sqmeters',
    activeColor = '#3D535D',
    completedColor = '#7D4479') %>%
  addControl("<P><b>Masterpiece Statistics 53</b>
  <br/>Search for offices/ industries<br/>in Java by name.</P>",
             position = 'topright')