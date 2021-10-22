//
//  FileDocumentWriteConfigurationProtocol.swift
//
//
//  Created by Christopher Weems on 9/10/20.
//

import struct SwiftUI.FileDocumentWriteConfiguration
import UniformTypeIdentifiers

@available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
@available(tvOS, unavailable)
public protocol FileDocumentWriteConfigurationProtocol {
    /// The uniform type of the file contents.
    var contentType: UTType { get }
    
    /// The file wrapper containing the current document content.
    /// `nil` if the document is unsaved.
    var existingFile: FileWrapper? { get }
    
}

@available(macOS 11, iOS 14, watchOS 7, *)
@available(tvOS, unavailable)
extension FileDocumentWriteConfiguration: FileDocumentWriteConfigurationProtocol { }
