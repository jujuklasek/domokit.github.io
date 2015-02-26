// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library http_server.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:services/http_server/public/http_request.mojom.dart' as http_request_mojom;
import 'package:services/http_server/public/http_response.mojom.dart' as http_response_mojom;


class HttpServerSetHandlerParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String pattern = null;
  Object handler = null;

  HttpServerSetHandlerParams() : super(kStructSize);

  static HttpServerSetHandlerParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpServerSetHandlerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpServerSetHandlerParams result = new HttpServerSetHandlerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.pattern = decoder0.decodeString(8, false);
    }
    {
      
      result.handler = decoder0.decodeServiceInterface(16, false, HttpHandlerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(pattern, 8, false);
    
    encoder0.encodeInterface(handler, 16, false);
  }
}

class HttpServerSetHandlerResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  HttpServerSetHandlerResponseParams() : super(kStructSize);

  static HttpServerSetHandlerResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpServerSetHandlerResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpServerSetHandlerResponseParams result = new HttpServerSetHandlerResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class HttpServerGetPortParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  HttpServerGetPortParams() : super(kStructSize);

  static HttpServerGetPortParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpServerGetPortParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpServerGetPortParams result = new HttpServerGetPortParams();

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

class HttpServerGetPortResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int port = 0;

  HttpServerGetPortResponseParams() : super(kStructSize);

  static HttpServerGetPortResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpServerGetPortResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpServerGetPortResponseParams result = new HttpServerGetPortResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.port = decoder0.decodeUint16(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(port, 8);
  }
}

class HttpHandlerHandleRequestParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  http_request_mojom.HttpRequest request = null;

  HttpHandlerHandleRequestParams() : super(kStructSize);

  static HttpHandlerHandleRequestParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpHandlerHandleRequestParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpHandlerHandleRequestParams result = new HttpHandlerHandleRequestParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.request = http_request_mojom.HttpRequest.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(request, 8, false);
  }
}

class HttpHandlerHandleRequestResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  http_response_mojom.HttpResponse response = null;

  HttpHandlerHandleRequestResponseParams() : super(kStructSize);

  static HttpHandlerHandleRequestResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpHandlerHandleRequestResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpHandlerHandleRequestResponseParams result = new HttpHandlerHandleRequestResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.response = http_response_mojom.HttpResponse.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(response, 8, false);
  }
}
const int kHttpServer_setHandler_name = 0;
const int kHttpServer_getPort_name = 1;

abstract class HttpServer implements core.Listener {
  static const String name = 'http_server::HttpServer';
  HttpServerStub stub;

  HttpServer(core.MojoMessagePipeEndpoint endpoint) :
      stub = new HttpServerStub(endpoint);

  HttpServer.fromHandle(core.MojoHandle handle) :
      stub = new HttpServerStub.fromHandle(handle);

  HttpServer.fromStub(this.stub);

  HttpServer.unbound() :
      stub = new HttpServerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  HttpServer get delegate => stub.delegate;
  set delegate(HttpServer d) {
    stub.delegate = d;
  }
  Future<HttpServerSetHandlerResponseParams> setHandler(String pattern,Object handler,[Function responseFactory = null]);
  Future<HttpServerGetPortResponseParams> getPort([Function responseFactory = null]);

}

class HttpServerProxy extends bindings.Proxy implements HttpServer {
  HttpServerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  HttpServerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HttpServerProxy.unbound() : super.unbound();

  String get name => HttpServer.name;

  static HttpServerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HttpServerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kHttpServer_setHandler_name:
        var r = HttpServerSetHandlerResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kHttpServer_getPort_name:
        var r = HttpServerGetPortResponseParams.deserialize(
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
  Future<HttpServerSetHandlerResponseParams> setHandler(String pattern,Object handler,[Function responseFactory = null]) {
    var params = new HttpServerSetHandlerParams();
    params.pattern = pattern;
    params.handler = handler;
    return sendMessageWithRequestId(
        params,
        kHttpServer_setHandler_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<HttpServerGetPortResponseParams> getPort([Function responseFactory = null]) {
    var params = new HttpServerGetPortParams();
    return sendMessageWithRequestId(
        params,
        kHttpServer_getPort_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class HttpServerStub extends bindings.Stub {
  HttpServer _delegate = null;

  HttpServerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  HttpServerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HttpServerStub.unbound() : super.unbound();

  static HttpServerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HttpServerStub(endpoint);

  static const String name = HttpServer.name;


  HttpServerSetHandlerResponseParams _HttpServerSetHandlerResponseParamsFactory(bool success) {
    var result = new HttpServerSetHandlerResponseParams();
    result.success = success;
    return result;
  }
  HttpServerGetPortResponseParams _HttpServerGetPortResponseParamsFactory(int port) {
    var result = new HttpServerGetPortResponseParams();
    result.port = port;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kHttpServer_setHandler_name:
        var params = HttpServerSetHandlerParams.deserialize(
            message.payload);
        return _delegate.setHandler(params.pattern,params.handler,_HttpServerSetHandlerResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kHttpServer_setHandler_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kHttpServer_getPort_name:
        var params = HttpServerGetPortParams.deserialize(
            message.payload);
        return _delegate.getPort(_HttpServerGetPortResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kHttpServer_getPort_name,
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

  HttpServer get delegate => _delegate;
      set delegate(HttpServer d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kHttpHandler_handleRequest_name = 0;

abstract class HttpHandler implements core.Listener {
  static const String name = 'http_server::HttpHandler';
  HttpHandlerStub stub;

  HttpHandler(core.MojoMessagePipeEndpoint endpoint) :
      stub = new HttpHandlerStub(endpoint);

  HttpHandler.fromHandle(core.MojoHandle handle) :
      stub = new HttpHandlerStub.fromHandle(handle);

  HttpHandler.fromStub(this.stub);

  HttpHandler.unbound() :
      stub = new HttpHandlerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  HttpHandler get delegate => stub.delegate;
  set delegate(HttpHandler d) {
    stub.delegate = d;
  }
  Future<HttpHandlerHandleRequestResponseParams> handleRequest(http_request_mojom.HttpRequest request,[Function responseFactory = null]);

}

class HttpHandlerProxy extends bindings.Proxy implements HttpHandler {
  HttpHandlerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  HttpHandlerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HttpHandlerProxy.unbound() : super.unbound();

  String get name => HttpHandler.name;

  static HttpHandlerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HttpHandlerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kHttpHandler_handleRequest_name:
        var r = HttpHandlerHandleRequestResponseParams.deserialize(
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
  Future<HttpHandlerHandleRequestResponseParams> handleRequest(http_request_mojom.HttpRequest request,[Function responseFactory = null]) {
    var params = new HttpHandlerHandleRequestParams();
    params.request = request;
    return sendMessageWithRequestId(
        params,
        kHttpHandler_handleRequest_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class HttpHandlerStub extends bindings.Stub {
  HttpHandler _delegate = null;

  HttpHandlerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  HttpHandlerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HttpHandlerStub.unbound() : super.unbound();

  static HttpHandlerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HttpHandlerStub(endpoint);

  static const String name = HttpHandler.name;


  HttpHandlerHandleRequestResponseParams _HttpHandlerHandleRequestResponseParamsFactory(http_response_mojom.HttpResponse response) {
    var result = new HttpHandlerHandleRequestResponseParams();
    result.response = response;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kHttpHandler_handleRequest_name:
        var params = HttpHandlerHandleRequestParams.deserialize(
            message.payload);
        return _delegate.handleRequest(params.request,_HttpHandlerHandleRequestResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kHttpHandler_handleRequest_name,
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

  HttpHandler get delegate => _delegate;
      set delegate(HttpHandler d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




