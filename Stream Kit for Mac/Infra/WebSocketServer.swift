//
//  SocketServer.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 06/11/24.
//

import Cocoa
import Network

class WebSocketServer {

    private var listener: NWListener?
    private var connections: [NWConnection] = []
    private var port: UInt16!

    init(port: UInt16) {
        self.port = port
    }

    func startListening() {
        do {
            let params = NWParameters.tcp
            listener = try NWListener(
                using: params, on: NWEndpoint.Port(integerLiteral: self.port))
        } catch {
            print("Falha ao iniciar o servidor: \(error)")
        }
    }

    private func handleNewConnection(_ connection: NWConnection) {
        self.connections.append(connection)

        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                print("Cliente conectado: \(connection)")
                self.recive(on: connection)
            case .failed(let error):
                print("Erro na conexão: \(error)")
                self.removeConnection(connection)
            case .cancelled:
                print("Conexão cancelada")
                self.removeConnection(connection)
            default:
                break

            }
        }

        connection.start(queue: .main)

    }

    private func recive(on connection: NWConnection) {
        connection.receive(
            minimumIncompleteLength: 1, maximumLength: 1024,
            completion: {
                data, _, isComplete, error in

                if let data = data, !data.isEmpty {
                    let message =
                        String(data: data, encoding: .utf8) ?? "<Data inválido>"
                    print("Mensagem recebida: \(message)")
                }

                if isComplete {
                    self.removeConnection(connection)
                } else if let error = error {
                    print("Erro ao receber dados: \(error)")
                    self.removeConnection(connection)
                } else {
                    self.recive(on: connection)
                }
            })
    }

    private func removeConnection(_ connection: NWConnection) {
        if let index = connections.firstIndex(where: { $0 === connection }) {
            connections.remove(at: index)
        }
        connection.cancel()
    }
}
