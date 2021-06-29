<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InteractionController extends Controller {
    
    public function addVisit(Request $request) {
        $user = $request->user();
        $publication_id = $request->get('publication_id');
        $old_interaction = $user->interactions()->where('publication_id', $publication_id)->first();
        if ($old_interaction) {
            $user->interactions()->updateExistingPivot($publication_id, [
                'visits' => $old_interaction->pivot->visits + 1
            ]);
        } else {
            $user->interactions()->attach([
                $publication_id => [
                    'visits' => 1
                ]
            ]);
        }
        return response()->json(['message' => 'Interacción actualizada'], 200);
    }

    public function updateLike(Request $request) {
        $user = $request->user();
        $publication_id = $request->get('publication_id');
        $reaction = $request->get('like') ? 'Y' : 'N';
        $user->interactions()->updateExistingPivot($publication_id, [
            'reaction' => $reaction
        ]);
        return response()->json(['message' => 'Interacción actualizada'], 200);
    }
}
