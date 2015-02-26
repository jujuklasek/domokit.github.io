// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library recipe.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class Ingredient extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  Ingredient() : super(kStructSize);

  static Ingredient deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Ingredient decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Ingredient result = new Ingredient();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
  }
}

class RecipeGetIngredientsParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  RecipeGetIngredientsParams() : super(kStructSize);

  static RecipeGetIngredientsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeGetIngredientsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeGetIngredientsParams result = new RecipeGetIngredientsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }
}

class RecipeGetIngredientsResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  List<Ingredient> ingredients = null;

  RecipeGetIngredientsResponseParams() : super(kStructSize);

  static RecipeGetIngredientsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeGetIngredientsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeGetIngredientsResponseParams result = new RecipeGetIngredientsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.ingredients = new List<Ingredient>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.ingredients[i1] = Ingredient.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (ingredients == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(ingredients.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < ingredients.length; ++i0) {
        
        encoder1.encodeStruct(ingredients[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}
const int kRecipe_getIngredients_name = 0;

abstract class Recipe implements core.Listener {
  static const String name = 'recipes::Recipe';
  RecipeStub stub;

  Recipe(core.MojoMessagePipeEndpoint endpoint) :
      stub = new RecipeStub(endpoint);

  Recipe.fromHandle(core.MojoHandle handle) :
      stub = new RecipeStub.fromHandle(handle);

  Recipe.fromStub(this.stub);

  Recipe.unbound() :
      stub = new RecipeStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Recipe get delegate => stub.delegate;
  set delegate(Recipe d) {
    stub.delegate = d;
  }
  Future<RecipeGetIngredientsResponseParams> getIngredients([Function responseFactory = null]);

}

class RecipeProxy extends bindings.Proxy implements Recipe {
  RecipeProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  RecipeProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeProxy.unbound() : super.unbound();

  String get name => Recipe.name;

  static RecipeProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kRecipe_getIngredients_name:
        var r = RecipeGetIngredientsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  Future<RecipeGetIngredientsResponseParams> getIngredients([Function responseFactory = null]) {
    var params = new RecipeGetIngredientsParams();
    return sendMessageWithRequestId(
        params,
        kRecipe_getIngredients_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class RecipeStub extends bindings.Stub {
  Recipe _delegate = null;

  RecipeStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  RecipeStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeStub.unbound() : super.unbound();

  static RecipeStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeStub(endpoint);

  static const String name = Recipe.name;


  RecipeGetIngredientsResponseParams _RecipeGetIngredientsResponseParamsFactory(List<Ingredient> ingredients) {
    var result = new RecipeGetIngredientsResponseParams();
    result.ingredients = ingredients;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kRecipe_getIngredients_name:
        var params = RecipeGetIngredientsParams.deserialize(
            message.payload);
        return _delegate.getIngredients(_RecipeGetIngredientsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kRecipe_getIngredients_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Recipe get delegate => _delegate;
      set delegate(Recipe d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




