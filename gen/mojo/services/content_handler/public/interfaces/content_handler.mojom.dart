// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library content_handler.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/public/interfaces/application/application.mojom.dart' as application_mojom;
import 'package:mojo/services/network/public/interfaces/url_loader.mojom.dart' as url_loader_mojom;


class ContentHandlerStartApplicationParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  Object application = null;
  url_loader_mojom.UrlResponse response = null;

  ContentHandlerStartApplicationParams() : super(kStructSize);

  static ContentHandlerStartApplicationParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ContentHandlerStartApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ContentHandlerStartApplicationParams result = new ContentHandlerStartApplicationParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.application = decoder0.decodeInterfaceRequest(8, false, application_mojom.ApplicationStub.newFromEndpoint);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.response = url_loader_mojom.UrlResponse.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(application, 8, false);
    
    encoder0.encodeStruct(response, 16, false);
  }
}
const int kContentHandler_startApplication_name = 0;

abstract class ContentHandler implements core.Listener {
  static const String name = 'mojo::ContentHandler';
  ContentHandlerStub stub;

  ContentHandler(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ContentHandlerStub(endpoint);

  ContentHandler.fromHandle(core.MojoHandle handle) :
      stub = new ContentHandlerStub.fromHandle(handle);

  ContentHandler.fromStub(this.stub);

  ContentHandler.unbound() :
      stub = new ContentHandlerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  ContentHandler get delegate => stub.delegate;
  set delegate(ContentHandler d) {
    stub.delegate = d;
  }
  void startApplication(Object application, url_loader_mojom.UrlResponse response);

}

class ContentHandlerProxy extends bindings.Proxy implements ContentHandler {
  ContentHandlerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ContentHandlerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ContentHandlerProxy.unbound() : super.unbound();

  String get name => ContentHandler.name;

  static ContentHandlerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ContentHandlerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void startApplication(Object application, url_loader_mojom.UrlResponse response) {
    var params = new ContentHandlerStartApplicationParams();
    params.application = application;
    params.response = response;
    sendMessage(params, kContentHandler_startApplication_name);
  }

}

class ContentHandlerStub extends bindings.Stub {
  ContentHandler _delegate = null;

  ContentHandlerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ContentHandlerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ContentHandlerStub.unbound() : super.unbound();

  static ContentHandlerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ContentHandlerStub(endpoint);

  static const String name = ContentHandler.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kContentHandler_startApplication_name:
        var params = ContentHandlerStartApplicationParams.deserialize(
            message.payload);
        _delegate.startApplication(params.application, params.response);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ContentHandler get delegate => _delegate;
      set delegate(ContentHandler d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


