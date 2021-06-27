<?php

namespace App\Http\Controllers;

use App\Models\Publication;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use function PHPUnit\Framework\isEmpty;

class PublicationController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($page) {
        $publicaciones = Publication::orderBy('publish_date', 'desc');
        if (!$publicaciones) {
            return response()->json(['message' => 'No se pudo recuperar la información de las publicaciones'], 400);
        }
        $total = $publicaciones->count();
        $data = $publicaciones->offset(($page - 1) * 5)->limit(5)->get();
        if ($data->count() == 0) {
            return response()->json(['message' => 'No existe lapágina que desea obtener'], 400);
        }

        return response()->json([
            'message' => 'Información recuperada exitosamente',
            'publications' => $data,
            'total' => $total,
             'page' => $page
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Illuminate\Http\Request;  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:'.Publication::MAX_LENGTH_TITLE,
            'content' => 'required',
            'author' => 'max:'.Publication::MAX_LENGTH_AUTHOR
        ], [
            'title.required' => 'Debe ingresar el título.',
            'title.max' => 'El título debe contener un máximo de :max caracteres.',
            'content.required' => 'Debe ingresar la publicación.',
            'author.max' => 'El autor debe contener un máximo de :max caracteres.'
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }
        
        $publication = new Publication([
            'image' => $request->image,
            'title' => $request->title,
            'content' => $request->content,
            'publish_date' => $request->publish_date,
            'author' => $request->author
        ]);

        if (!$publication->save()) {
            return response()->json(['message' => 'No se pudo almacenar la publicación, intente de nuevo'], 400);
        }

        return response()->json(['message' => 'Publicación almacenada correctamente'], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Publication  $publication
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Publication  $publication
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Publication $publication)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Publication  $publication
     * @return \Illuminate\Http\Response
     */
    public function destroy(Publication $publication)
    {
        //
    }
}
