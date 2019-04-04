defmodule ProbandoPhoenixLiveView.Consumir do
    def list do
        response = HTTPotion.get "https://restcountries.eu/rest/v2/all"
        response.body |> Jason.decode!
    end
end