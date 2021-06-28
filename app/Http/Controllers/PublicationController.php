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
    public function index(Request $request) {
        $page = $request->query('page', 1);
        $publicaciones = Publication::orderBy('publish_date', 'desc');
        if (!$publicaciones) {
            return response()->json(['message' => 'No se pudo recuperar la información de las publicaciones'], 400);
        }
        $total = $publicaciones->count();
        $data = $publicaciones->offset(($page - 1) * 5)->limit(5)->get();
        if ($data->count() == 0 && $page != 1) {
            return response()->json(['message' => 'No existe la página que desea obtener'], 400);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $publication = Publication::find($id);
        if (!$publication) {            
            return response()->json(['message' => 'No existe la publicación que desea obtener'], 400);
        }
        return response()->json([
            'message' => 'Publicación recuperada correctamente',
            'publication' => $publication
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $publication = Publication::find($id);
        if (!$publication) {            
            return response()->json(['message' => 'No existe la publicación que desea obtener'], 400);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'max:'.Publication::MAX_LENGTH_TITLE,
            'author' => 'max:'.Publication::MAX_LENGTH_AUTHOR
        ], [
            'title.max' => 'El título debe contener un máximo de :max caracteres.',
            'author.max' => 'El autor debe contener un máximo de :max caracteres.'
        ]);
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }
        
        $publication->image = $request->image;
        $publication->title = $request->title;
        $publication->content = $request->content;
        $publication->publish_date = $request->publish_date ? $request->publish_date : $publication->publish_date;
        $publication->author = $request->author;
        if (!$publication->save()) {
            return response()->json(['message' => 'No se pudo actualizar la publicación, intente de nuevo'], 400);
        }

        return response()->json(['message' => 'Publicación actualizada correctamente'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $publication = Publication::find($id);
        if (!$publication) {            
            return response()->json(['message' => 'No existe la publicación que desea eliminar'], 400);
        }
        if (!$publication->delete()) {            
            return response()->json(['message' => 'No se ha podido eliminar la publicación'], 400);
        }

        return response()->json(['message' => 'Publicación eliminada correctamente'], 200);

    }
}
