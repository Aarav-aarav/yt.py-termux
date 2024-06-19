#!/usr/bin/env python

from youtubesearchpython import VideosSearch
import subprocess
import yt_dlp

# Function to search YouTube and return video URLs and titles
def search_youtube(query):
    videos_search = VideosSearch(query, limit=10)
    results = videos_search.result()
    video_urls = []
    titles = []
    for video in results['result']:
        video_urls.append(video['link'])
        titles.append(video['title'])
    return video_urls, titles

# Function to download a video by video URL
def download_video(video_url):
    ydl_opts = {
        'format': 'bestvideo+bestaudio/best',
        'outtmpl': 'video.mp4',
        'quiet': True,
    }
    try:
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download([video_url])
        
        # Play the downloaded video using VLC
        subprocess.run(["vlc", "mpv", "video.mp4.webm"])
    except Exception as e:
        print(f"Error downloading video {video_url}: {e}")

# Main function
def main():
    print("Welcome to YouTube Downloader in Termux!")
    print("1. Search videos")
    print("2. Enter video URL")
    choice = input("Enter your choice (1 or 2): ")

    if choice == "1":
        query = input("Enter your search query: ")
        video_urls, titles = search_youtube(query)
        if not video_urls:
            print("No videos found.")
            return
        print("Search results:")
        for i, title in enumerate(titles, start=1):
            print(f"{i}. {title}")
        
        selection = input("Enter the number of the video you want to download (e.g., 1 for the top result): ")
        try:
            selection = int(selection) - 1
            if 0 <= selection < len(video_urls):
                download_video(video_urls[selection])
            else:
                print("Invalid selection.")
        except ValueError:
            print("Invalid input. Please enter a number.")

    elif choice == "2":
        url = input("Enter the YouTube video URL: ")
        download_video(url)
    else:
        print("Invalid choice. Exiting.")

if __name__ == "__main__":
    main()
