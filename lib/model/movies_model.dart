// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
    List<Cast> cast;
    String certificate;
    String description;
    String duration;
    int id;
    List<String> language;
    String name;
    double rating;
    String releaseDate;
    List<Review> reviews;
    String screenTag;
    List<String> tags;
    List<Theatre> theatres;
    String thumbnail;
    String trailerUrl;
    String votes;

    Movie({
        required this.cast,
        required this.certificate,
        required this.description,
        required this.duration,
        required this.id,
        required this.language,
        required this.name,
        required this.rating,
        required this.releaseDate,
        required this.reviews,
        required this.screenTag,
        required this.tags,
        required this.theatres,
        required this.thumbnail,
        required this.trailerUrl,
        required this.votes,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        certificate: json["certificate"],
        description: json["description"],
        duration: json["duration"],
        id: json["id"],
        language: List<String>.from(json["language"].map((x) => x)),
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        releaseDate: json["releaseDate"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        screenTag: json["screenTag"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        theatres: List<Theatre>.from(json["theatres"].map((x) => Theatre.fromJson(x))),
        thumbnail: json["thumbnail"],
        trailerUrl: json["trailerUrl"],
        votes: json["votes"],
    );

    Map<String, dynamic> toJson() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "certificate": certificate,
        "description": description,
        "duration": duration,
        "id": id,
        "language": List<dynamic>.from(language.map((x) => x)),
        "name": name,
        "rating": rating,
        "releaseDate": releaseDate,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "screenTag": screenTag,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "theatres": List<dynamic>.from(theatres.map((x) => x.toJson())),
        "thumbnail": thumbnail,
        "trailerUrl": trailerUrl,
    };
}

class Cast {
    String character;
    String image;
    String name;

    Cast({
        required this.character,
        required this.image,
        required this.name,
    });

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        character: json["character"],
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "character": character,
        "image": image,
        "name": name,
    };
}

class Review {
    String description;
    int dislikes;
    String hashTags;
    int likes;
    String name;
    int rating;

    Review({
        required this.description,
        required this.dislikes,
        required this.hashTags,
        required this.likes,
        required this.name,
        required this.rating,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        description: json["description"],
        dislikes: json["dislikes"],
        hashTags: json["hashTags"],
        likes: json["likes"],
        name: json["name"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "dislikes": dislikes,
        "hashTags": hashTags,
        "likes": likes,
        "name": name,
        "rating": rating,
    };
}

class Theatre {
    bool cancellation;
    bool favourite;
    String location;
    List<Seating> seating;
    List<Slot> slots;
    String theatreName;

    Theatre({
        required this.cancellation,
        required this.favourite,
        required this.location,
        required this.seating,
        required this.slots,
        required this.theatreName,
    });

    factory Theatre.fromJson(Map<String, dynamic> json) => Theatre(
        cancellation: json["cancellation"],
        favourite: json["favourite"],
        location: json["location"],
        seating: List<Seating>.from(json["seating"].map((x) => Seating.fromJson(x))),
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        theatreName: json["theatreName"],
    );

    Map<String, dynamic> toJson() => {
        "cancellation": cancellation,
        "favourite": favourite,
        "location": location,
        "seating": List<dynamic>.from(seating.map((x) => x.toJson())),
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "theatreName": theatreName,
    };
}

class Seating {
    double amount;
    List<Columns> column;
    int id;
    String name;

    Seating({
        required this.amount,
        required this.column,
        required this.id,
        required this.name,
    });

    factory Seating.fromJson(Map<String, dynamic> json) => Seating(
        amount: json["amount"]?.toDouble(),
        column: List<Columns>.from(json["column"].map((x) => Columns.fromJson(x))),
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "column": List<dynamic>.from(column.map((x) => x.toJson())),
        "id": id,
        "name": name,
    };
}

class Columns {
    String id;
    List<Seat> seats;

    Columns({
        required this.id,
        required this.seats,
    });

    factory Columns.fromJson(Map<String, dynamic> json) => Columns(
        id: json["id"],
        seats: List<Seat>.from(json["seats"].map((x) => Seat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "seats": List<dynamic>.from(seats.map((x) => x.toJson())),
    };
}

class Seat {
    int id;
    bool show;
    bool sold;

    Seat({
        required this.id,
        required this.show,
        required this.sold,
    });

    factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        id: json["id"],
        show: json["show"],
        sold: json["sold"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "show": show,
        "sold": sold,
    };
}

class Slot {
    String availability;
    String tag;
    String time;

    Slot({
        required this.availability,
        required this.tag,
        required this.time,
    });

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        availability: json["availability"],
        tag: json["tag"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "availability": availability,
        "tag": tag,
        "time": time,
    };
}
