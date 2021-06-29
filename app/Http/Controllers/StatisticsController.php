<?php

namespace App\Http\Controllers;

use App\Models\Publication;
use Illuminate\Http\Request;

class StatisticsController extends Controller {
    
    public function visitsPerPublications() {
        $publications = Publication::with('interactions')->get();
        $visits_per_publications = [];
        foreach ($publications as $publication) {
            $views = 0;
            foreach ($publication->interactions as $interaction) {
                $views += $interaction->pivot->visits;
            };
            $data = [
                "publication_id" => $publication->id,
                "publication" => $publication->title,
                "views" => $views
            ];
            array_push($visits_per_publications, $data);
        }
        return response()->json([
            'message' => 'Información obtenida correctamente',
            'visits_per_publications' => $visits_per_publications
        ], 200);
    }

    public function publicationsVisitsByUsers() {
        $publications = Publication::with('interactions')->get();
        $publications_visits_by_users = [];
        foreach ($publications as $publication) {
            $per_interaction = [];
            foreach ($publication->interactions as $interaction) {
                array_push($per_interaction, [
                    "user_id" => $interaction->pivot->user_id,
                    "visits" => $interaction->pivot->visits
                ]);
            };
            $data = [
                "publication_id" => $publication->id,
                "publication" => $publication->title,
                "users_interactions" => $per_interaction
            ];
            array_push($publications_visits_by_users, $data);
        }
        return response()->json([
            'message' => 'Información obtenida correctamente',
            'visits_per_publications' => $publications_visits_by_users
        ], 200);
    }

    public function publicationsReactions() {
        $publications = Publication::with('interactions')->get();
        $publications_reactions = [];
        foreach ($publications as $publication) {
            $likes = 0;
            $dislikes = 0;
            foreach ($publication->interactions as $interaction) {
                if ($interaction->pivot->reaction == 'Y') {
                    $likes++;
                } else if ($interaction->pivot->reaction == 'N') {
                    $dislikes++;
                }
            };
            $data = [
                "publication_id" => $publication->id,
                "publication" => $publication->title,
                "likes" => $likes,
                "dislikes" => $dislikes
            ];
            array_push($publications_reactions, $data);
        }
        return response()->json([
            'message' => 'Información obtenida correctamente',
            'publications_reactions' => $publications_reactions
        ], 200);
    }
}
