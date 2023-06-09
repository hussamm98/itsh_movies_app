class AppConsts{
//movie id  436270
  static const kBaseURL = "https://api.themoviedb.org/3";
  static const kAppApiKey = "a5abf7e3ff574f284e30710e6de3fbfd";

  static const kGetNowPlayingMoviesPath = "$kBaseURL/movie/now_playing?api_key=$kAppApiKey";
  static const kTopRatedMoviesPath = "$kBaseURL/movie/top_rated?api_key=$kAppApiKey";
  static const kPopularMoviesPath = "$kBaseURL/movie/popular?api_key=$kAppApiKey";
  static const kUpComingMoviesPath = "$kBaseURL/movie/upcoming?api_key=$kAppApiKey";
  static const kTopRatedSeriesPath = "$kBaseURL/tv/top_rated?api_key=$kAppApiKey";
  static const kPopularSeriesPath = "$kBaseURL/tv/popular?api_key=$kAppApiKey";
  static kMovieDetailsPath(int movieId)=> "$kBaseURL/movie/$movieId?api_key=$kAppApiKey";
  static kTVDetailsPath(int tvId)=> "$kBaseURL/tv/$tvId?api_key=$kAppApiKey";
  static kMovieRecommendationPath(int movieId)=> "$kBaseURL/movie/$movieId/recommendations?api_key=$kAppApiKey";
  static kTVRecommendationPath(int tvId)=> "$kBaseURL/tv/$tvId/recommendations?api_key=$kAppApiKey";
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=> "$baseImageUrl$path";
  static String imdbPath(String path)=> "https://www.imdb.com/title/$path";
}

// series details https://api.themoviedb.org/3/tv/94605?api_key=a5abf7e3ff574f284e30710e6de3fbfd
// series id 94605


// https://api.themoviedb.org/3/tv/94605/recommendations?api_key=a5abf7e3ff574f284e30710e6de3fbfd
// series id 94605