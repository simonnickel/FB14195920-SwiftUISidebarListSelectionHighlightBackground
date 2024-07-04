//
//  ContentView.swift
//  SwiftUISidebarHighlight
//
//  Created by Simon Nickel on 30.06.24.
//

import SwiftUI

struct ContentView: View {
	
    var body: some View {
		
		splitView
			.labelStyle(LabelStyleSidebar())

    }
	
	var splitView: some View {
		
		NavigationSplitView {
			List {
				NavigationLink(value: "rectangle") {
					Label {
						Text("Rectangle")
							.foregroundStyle(.pink)
							.fontDesign(.monospaced)
					} icon: {
						Image(systemName: "rectangle")
					}
					.labelStyle(LabelStyleSidebarElement(selected: true))
				}
				.listRowBackground(Color.gray)
				
				NavigationLink(value: "circle") {
					Label {
						Text("Circle")
					} icon: {
						Image(systemName: "circle")
					}
					.labelStyle(LabelStyleSidebarElement(selected: false))
				}
			}
		} detail: {
			Text("Content")
		}

		
	}
}

struct LabelStyleSidebar: LabelStyle {

	func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
		} icon: {
			configuration.icon
		}
		.tint(.yellow)
	}
	
}

struct LabelStyleSidebarElement: LabelStyle {
	
	let selected: Bool
	
	func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
		} icon: {
			configuration.icon
		}
		.tint(selected ? .red : .orange)
	}
	
}

#Preview {
    ContentView()
}
