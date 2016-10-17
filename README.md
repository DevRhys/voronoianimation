# Voronoi Animation

This is an example of how to create and store 2D Voronoi tessellations in iOS, display those tessellations as overlays of an MKMapView, and most interestingly, how to animate those tessellations when a user drags annotations around the map. The core of the project is an iOS-friendly port of an Objective C implementation of Fortune's Algorithm. This port will soon move into its own project/pod, leaving this project as an example of its use.

## Getting Started

NOTE: This code runs best on the device - the simulator has a hard time smoothly animating the overlays on the MKMapView. It will work on the simulator, it will just feel clunky.

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Rhys Jones** - *Initial work* - [DevRhys](https://github.com/DevRhys)

See also the list of [contributors](https://github.com/DevRhys/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

The code which performs the actual Voronoi tessellations an iOS-friendly port of an Objective-C port of a JavaScript implementation of Steven Fortune's original C implementation at Bell Labs.

Genealogy:

Steven Fortune's initial C implementation can be found at [his Bell Labs home page](http://ect.bell-labs.com/who/sjf/)
Raymond Hill's JavaScript implementation of Fortune's algorithm can be found [here]( https://github.com/gorhill/Javascript-Voronoi)
Clay Heaton's Objective-C port of Raymond Hill's implementation can be found [here](https://github.com/clayheaton/objcvoronoi)

An explanation of Fortune's algorithm can be found at [Wikipedia](https://en.wikipedia.org/wiki/Fortune%27s_algorithm)
